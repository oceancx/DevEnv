source ~/.bash_rc
bashName=`GetFileNameFromPath $1`
echo $bashName
path=`echo "/usr/bin/${bashName}"`
echo $path
rm `echo $path`
echo "ln -s $1 $path"
ln -s $1 $path 


