rmdir masks\class /q /s
mkdir masks\class

cd out_alpha
mogrify -alpha extract -quality 100 -path ../masks/class *.png
cd ..

rmdir images_64x64\class /q /s
mkdir images_64x64\class
cd out_res
mogrify -resize 64x64 -quality 100 -path ../images_64x64/class *.png
cd ..

rmdir masks_64x64\class /q /s
mkdir masks_64x64\class
cd masks\class
mogrify -resize 64x64 -quality 100 -path ../../masks_64x64/class *.png
cd ..\..
