COMPARE_DIR=./compare

cd $COMPARE_DIR;
for img in `find ./ -name "*.jpg"`; do 
    sips --resampleWidth 1920 $img
    sips -s format jpeg $img --out ${img%.*}.jpg
    # rm $img
done

cd ..;
mkdir before;

i=39
for img in `find ./compare/ -name "before.jpg"`; do 
    cp $img before/$i.jpg
    let i++
done

mkdir after;

i=39
for img in `find ./compare/ -name "after.jpg"`; do 
    cp $img after/$i.jpg
    let i++
done