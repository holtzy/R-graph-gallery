FILE=$1
convert Capture*.png -resize 480x480 new.png
convert -size 480x480 xc:white new.png  -gravity center -composite output.png
mv output.png $FILE
rm Capture*.png new.png
