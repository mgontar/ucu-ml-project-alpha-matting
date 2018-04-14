SETLOCAL ENABLEDELAYEDEXPANSION 

FOR /L %%I IN (1,1,10) DO (
	IF %%I LSS 10 (SET ip=0%%I) ELSE (SET ip=%%I)
	FOR /L %%J IN (1,1,12) DO (
		IF %%J LSS 10 (SET jp=0%%J) ELSE (SET jp=%%J)
		ECHO %%I !ip! %%J !jp!
		composite  -gravity center  -quality 100  obj\mario_!jp!.png bg\bg_!ip!.jpg -resize "960x849^^" out\res_!jp!_!ip!.jpg
		mogrify  -gravity center -resize "512x512^^" -crop 512x512+0+0 +repage out\res_!jp!_!ip!.jpg
		))