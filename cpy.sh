for((i=53;i<=63;i++))
do 
	if [ ! -d ./compare/$i ]; then
        mkdir ./compare/$i
    fi

    cp -r ./before/$i.jpg ./compare/$i/before.jpg
    cp -r ./after/$i.jpg ./compare/$i/after.jpg
done
