source ./BashEnv.sh
bashName=`GetFileNameFromPath $1`
echo $bashName
path=`echo "/usr/bin/${bashName}"`
rm `echo $path`
echo "ln -s $1 $path"
ln -s $1 $path 


