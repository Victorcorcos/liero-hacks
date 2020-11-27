# Liero Graphics 🎨

Here you can find some tutorials regarding how to manage the Liero graphics!

The [Gimp](https://www.gimp.org/) software is recommended, but some people managed to use Photoshop for the same purpose.

@pilaf created [this awesome introduction tutorial](https://github.com/pilaf/liero-palettes). A perfect start to manage Liero palletes, maps and sprites using [Gimp](https://www.gimp.org/).


## Brief Explanation 🎯

WebLiero has the `mod.json` and the `sprites.wlsprt` file:

1. `mod.json` is responsible to handle the **logic**
2. `sprites.wlsprt` is responsible to handle the **graphics**

As you see, the `sprites.wlsprt` has a very unique extension.

In order to work with liero sprites, you need to to **Import** and **Export** these files into `.png` files.

To achieve this, you can use `wltools`. The usage part [is documented right here](https://github.com/Victorcorcos/liero-hacks/tree/main/converter/wltools).


## Hints 💭

I noticed that we need to discover which is the **center** of the sprite picture in order to place it on the name of the sprite file...

The file need to have the following format:

```rb
1_WWWW_HHHH.png
```

* **W**: Width of the Center, in **hexadecimal**! 16 bit signed hex integers.
* **H**: Heigh of the Center, in **hexadecimal**! 16 bit signed hex integers.

For example:

```rb
1_FFAA_FFAB.png
```

I produced [this tutorial video](https://vimeo.com/482727607), automating the process to find the **center** of the picture.

You just need to have the `ruby` installed on your computer, run `irb` on the terminal and use this little ruby method ❤️

```rb
def center(x, y)
  position = (0xFFFF - x).to_s(16) + '_' + (0xFFFF - y).to_s(16)
  position.upcase
end
```

* Example

```rb
> center(23, 24)

=> "FFE8_FFE7"
```
