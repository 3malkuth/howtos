* Resize images for the web etc.
* Linux
```
convert blah.jpg -resize 1200 test.jpg
convert blah.png -resize 1200x800 test.jpg # 1200x600 = widthxheight
convert -resize 32x32 favicon.png -flatten -colors 256 -background transparent favicon.ico
# OR...
convert -resize x32 -gravity center -crop 32x32+0+0 input.png -flatten -colors 256 -background transparent favicon.ico
```
* Mac
```
$ sips --resampleWidth 1200 marc-wieland-52629.jpg --out rushingriver.jpg
```
