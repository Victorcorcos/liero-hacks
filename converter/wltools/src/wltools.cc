#include <fstream>
#include <list>
#include <string>
#include <algorithm>

#include "format.h"
#include "filesystem.h"
#include "png++/png.hpp"
#include "lyra/lyra.hpp"

char * wlsprites_bin;
#include "palette.h"

png::palette liero_palette(256);

short as_int16(char * buffer) {
    return static_cast<short>(static_cast<unsigned char>(buffer[1]) << 8 |
        static_cast<unsigned char>(buffer[0]));
}

void put_int16(char * buffer, short n) {
	buffer[0] = static_cast<char>(n&0xFF);
	buffer[1] = static_cast<char>((n&(~0xFF))>>8);
}

void init() {
	for(int i = 0; i<256; i++) {
		liero_palette[i] = png::color(lpl_bin[i*3], lpl_bin[i*3+1], lpl_bin[i*3+2]);
	}
}

void dump_sprites(fs::path source, fs::path destination) {
	std::ifstream f_wlsprites(source, std::ios::in|std::ios::binary);
	if(f_wlsprites.is_open()) {
		f_wlsprites.seekg(0,std::ios::end);
		int length = f_wlsprites.tellg();
		wlsprites_bin = new char[length];
		f_wlsprites.seekg(0, std::ios::beg);
		f_wlsprites.read(wlsprites_bin, length);
	} else {
		std::cout << "Error opening source: " << source << std::endl;
		exit(1);
	}
	f_wlsprites.close();

	if(!(wlsprites_bin[0]=='W'
	&& wlsprites_bin[1]=='L'
	&& wlsprites_bin[2]=='S'
	&& wlsprites_bin[3]=='P'
	&& wlsprites_bin[4]=='R'
	&& wlsprites_bin[5]=='T')) {
		std::cout << "Invalid WLSPRT: " << source << std::endl;
		exit(1);
	}
	
	if(!(wlsprites_bin[6]==0&&wlsprites_bin[7]==0)) {
		std::cout << "Only WLSPRT version 0 is supported: " << source << std::endl;
		exit(1);
	}

	std::error_code ec;
	if(!fs::create_directories(destination,ec)) {
		std::cout << "Destination must be a valid directory: " << destination << std::endl;
		exit(1);
	}

	if(wlsprites_bin[8]) {
		int o = 0x9;
		for(int i = 0; i<256; i++) {
			liero_palette[i] = png::color(wlsprites_bin[i*3+o], wlsprites_bin[i*3+1+o], wlsprites_bin[i*3+2+o]);
		}
	}

	fs::path palette =  destination / "palette.png";
	png::image< png::rgb_pixel > palette_image(256,1);
	for(int i = 0; i<256; i++) {
		auto c = liero_palette[i];
		palette_image[0][i] = png::rgb_pixel(c.red,c.green,c.blue);
	}
	palette_image.write(palette);

	int sprite_offset = wlsprites_bin[8]? 0x309 : 0x9;
	int nsprites = as_int16(wlsprites_bin+sprite_offset);
	sprite_offset+=2;

	for(int id=0; id<nsprites; id++) {
		short width = as_int16(wlsprites_bin+sprite_offset);
		short height = as_int16(wlsprites_bin+sprite_offset+2);
		short xoffset = as_int16(wlsprites_bin+sprite_offset+4);
		short yoffset = as_int16(wlsprites_bin+sprite_offset+6);
		if(width>0 && height>0) {
			png::image<png::index_pixel> image(width, height);
			image.set_palette(liero_palette);
			for (uint32_t y = 0; y < image.get_height(); y++) {
				for (uint32_t x = 0; x < image.get_width(); x++) {
					image.set_pixel(x,y, wlsprites_bin[sprite_offset+8+y*width+x]);
				}
			}
			//printf("I:%d\tO:%08X\tW:%d\tH:%d\tX:%04hX\tY:%04hX\n",id,sprite_offset,width,height,xoffset,yoffset);
			image.write(string_format("%s/%d_%04hX_%04hX.png",destination.c_str(),id,xoffset,yoffset));
			sprite_offset += 8+width*height;
		} else {
			return;
		}
	}
}

struct import_sprite {
	short id=0, xoffset=0, yoffset=0;
	fs::path image_path;
};

void import_sprites(fs::path source, fs::path destination) {
	if(fs::is_directory(destination)) {
		std::cout << "Destination can not be a directory: " << destination << std::endl;
		exit(1);
	}

	std::list<import_sprite> sprites;
	for(auto& p: fs::directory_iterator(source)) {
		import_sprite spr;
		spr.image_path = p.path();
		int n = sscanf(p.path().filename().c_str(), "%hd_%04hX_%04hX.png", &spr.id, &spr.xoffset, &spr.yoffset);
		if(n == 3) {
			sprites.push_back(spr);
		}
	}
	
	sprites.sort([](const import_sprite &x, const import_sprite &y){
		return x.id < y.id;
	});

	std::ofstream out(destination, std::ios::out|std::ios::binary);

	auto out_write8 = [&out](unsigned char c) {
		char buffer[1] = {static_cast<char>(c)};
		out.write(buffer,1);
	};

	auto out_write16 = [&out](short c) {
		char buffer[2];
		put_int16(buffer, c);
		out.write(buffer,2);
	};

	out.write("WLSPRT",6);
	out_write16(0); // version 0
	out_write8(1); // Include palette

	fs::path palette =  source / "palette.png";
	std::cout << palette.string() << std::endl;
	if(fs::exists(palette) ) {
		png::image< png::rgb_pixel > palette_image(palette);
		for(int i = 0; i<256; i++) {
			auto c = palette_image.get_pixel(i,0);
			char b[] = {static_cast<char>(c.red),static_cast<char>(c.green),static_cast<char>(c.blue)};
			out.write(b,3);
		}
	} else {
		out.write((char*)lpl_bin, 768);
	}

	short nsprites = sprites.size();
	out_write16(nsprites);

	for(auto spr: sprites) {
		png::image<png::index_pixel> image(spr.image_path.string());
		short width = image.get_width();
		short height = image.get_height();
		//printf("I:%hd\tW:%hd\tH:%hd\tX:%hd\tY:%hd\n",spr.id,width,height,spr.xoffset,spr.yoffset);
		out_write16(width);
		out_write16(height);
		out_write16(spr.xoffset);
		out_write16(spr.yoffset);
		for(int y=0;y<height;y++) {
			for(int x=0;x<width;x++) {
				char b[1];
				b[0] = image.get_pixel(x,y);
				out.write(b,1);
			}
		}
	}
	
	out.close();
}

int main(int argc, char **argv) {
	std::string source, destination, palette_path;
	bool show_help = false;
	auto cli = lyra::cli_parser();

	cli |= lyra::help(show_help);
	//cli |= lyra::opt(palette_path, "palette")["-p"]["--palette"]("Use palette from given lpl file.").optional();
	cli |= lyra::arg(source, "source")("Source wlsprt or directory").required();
	cli |= lyra::arg(destination, "destination")("Destination wlsprt or directory").required();

	auto result = cli.parse({argc, argv});

    if (!result) {
        std::cerr << "Error: " << result.errorMessage() << std::endl;
        std::cerr << cli << std::endl; 
        exit(1);
    }

    if (show_help) {
        std::cout << cli << std::endl;
        exit(0);
    }

	init();

	if(fs::is_directory(source)) {
		std::cout << "Converting PNGs in [" << source;
		std::cout << "] to destination WLSPRT [" << destination << "]." << std::endl;
		import_sprites(source,destination);
	}

	if(fs::is_regular_file(source)) {
		std::cout << "Converting WLSPRT [" << source;
		std::cout << "] to PNGs in [" << destination << "]." << std::endl;
		dump_sprites(source,destination);
	}
}