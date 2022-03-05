SRC_DIR=./src

i=64
cd $SRC_DIR;
for img in `ls *.jpg`; do 
	if [ ! -d ../compare/$i ]; then
        mkdir ../compare/$i
    fi

    Width=$(convert $img -print "%w" /dev/null)
    Height=$(convert $img -print "%h" /dev/null)

   	# 通过文件名判断图片排列方向
    isLanding=$(echo $img | grep "_L.")
	if [[ "$isLanding" != "" ]]
	then
		Width=`expr $Width / 2`
		Size=$Width'x'$Height
		echo $Size
		convert $img -crop $Size+0+0 ../compare/$i/before.jpg
    	convert $img -crop $Size+$Width+0 ../compare/$i/after.jpg

    	mv $img ./$i'_L'.jpg
    	let i++
	fi

	# 通过文件名判断图片排列方向
    isProtrait=$(echo $img | grep "_P.")
	if [[ "$isProtrait" != "" ]]
	then
		Height=`expr $Height / 2`
		Size=$Width'x'$Height
		echo $Size
		convert $img -crop $Size+0+0 ../compare/$i/before.jpg
    	convert $img -crop $Size+0+$Height ../compare/$i/after.jpg

    	mv $img ./$i'_P'.jpg
    	let i++
	fi

done
