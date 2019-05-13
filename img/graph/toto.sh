FILE=$1
convert Screensh*.png -resize 768x576  new.png
convert -size 768x576  xc:white new.png  -gravity center -composite output.png
mv output.png $FILE
rm Screensh*.png new.png
