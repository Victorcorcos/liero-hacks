# Liero Graphics Tutorials 🏗️

Here you can find some tutorials regarding how to manage the Liero graphics!

The Gimp software is recommended, but some people managed to use Photoshop for the same purpose.

@pilaf created [this awesome introduction tutorial](https://github.com/pilaf/liero-palettes) that is a perfect start to manage Liero palletes, maps and sprites using Gimp.


# Sprites Tutorial ⛑️ 

WebLiero has the `mod.json` and the `sprites.wlsprt` file:

1. `mod.json` is responsible to handle the **logic**
2. `sprites.wlsprt` is responsible to handle the **graphics**

As you see, the `sprites.wlsprt` has a very unique extension.

In order to work with liero sprites, you need to to **Import** and **Export** these files into `.png` files.

To achieve this, you can use `wltools`. The usage part [is documented right here](https://github.com/Victorcorcos/liero-hacks/tree/main/converter/wltools).


## The Sprite Center 💭


I noticed that we need to discover which is the **center** of the sprite picture in order to write it on the name of the sprite file!

The file have the following format..

```rb
1_WWWW_HHHH.png
```

**W**: Width, in **hexadecimal**!
**H**: Heigh, in **hexadecimal**!

For example:

```rb
1_FFAA_FFAB.png
```

I produced [this tutorial video](https://vimeo.com/482727607), showing how to access the **center** of the pictures by executing this ruby method ❤️ 

```rb
def center(x, y)
  position = (0xFFFF - x).to_s(16) + '_' + (0xFFFF - y).to_s(16)
  position.upcase
end
```

* Example

```rb
center(23, 24)
```
