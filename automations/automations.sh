## Export .wlsprt file to .png files
# Execute inside the /mod folder you are working with (E.g. /csliero)
liero_export() {
  ../../converter/wltools/wltools sprites.wlsprt  original_sprites/
  cp -r original_sprites sprites
}

## Import .png files to .wlsprt file
# Execute inside the /mod folder you are working with (E.g. /csliero)
liero_import() {
  ../../converter/wltools/wltools sprites/ new_sprites.wlsprt
}

## 1) Import .png files to .wlsprt file (with wltools)
## 2) Execute the parser (parser.rb)
# Execute inside the /mod folder you are working with (E.g. /csliero)
liero_update() {
  ../../converter/wltools/wltools sprites/ new_sprites.wlsprt
  ruby parser.rb
}

## Rename the .png files by prepending ordered numbers starting from the desired number
# Usage: order_files 110
# It rename the .png files to 110_xxx.png, 111_xxx.png, 112_xxx.png, yyy_xxx.png
liero_rename() {
  # Renames files prepending ordered integers
  a=$1
  for i in *.png; do
    new=$(printf "%03d" "$a")
    mv -i -- "$i" "$new$i"
    let a=a+1
  done

  # Remove next three integers
  rename 's/\d{3}_/_/' *.png
}

## Use it to discover the hexadecimal value (HHHH_HHHH) you need to put on the name of sprite .png file
## Use the x and y center coordinates
# Usage: liero_center x y
# Example: liero_center 20 15
#  result:   FFEB_FFF0
#    file: 1_FFEB_FFF0.png
liero_center() {
  ruby -e "
    def center(x, y)
      position = (0xFFFF - x).to_s(16) + '_' + (0xFFFF - y).to_s(16)
      position.upcase
    end

    puts center($1, $2)
  "
}
