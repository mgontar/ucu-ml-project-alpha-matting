rmdir images_224x224\class /q /s
mkdir images_224x224\class
cd out_res
mogrify -resize 224x224 -quality 100 -path ../images_224x224/class *.png
cd ..

rmdir masks_224x224\class /q /s
mkdir masks_224x224\class
cd masks\class
mogrify -resize 224x224 -quality 100 -path ../../masks_224x224/class *.png
cd ..\..
