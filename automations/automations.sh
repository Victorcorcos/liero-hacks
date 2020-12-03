# Extract .wlsprt file to .png files
liero_sprites() {
  ../../converter/wltools/wltools sprites.wlsprt  original_sprites/
  cp -r original_sprites sprites
}

# Execute inside the /mod folder you are working with (E.g. /csliero)
# 1) Import .png files with wltools
# 2) Execute the parser (parser.rb)
liero_update() {
  ../../converter/wltools/wltools sprites/ new_sprites.wlsprt
  ruby parser.rb
}

# Rename the .png files by prepending ordered numbers starting from the desired number
# Usage: order_files 110
# It rename the .png files to 110_xxx.png, 111_xxx.png, 112_xxx.png, yyy_xxx.png
order_files() {
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
