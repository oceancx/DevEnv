##判断$1是路径 还是文件名
source ./BashEnv.sh
applink=$2
echo $1
if [[ $1 == '.' ]];then
	start $applink `pwd`
	exit
elif [[ $1 == '..' ]]; then
	start $applink `cd ..;pwd`
	exit
fi

IsFilePath $1
if [[ $? -eq 0 ]];then
	path="`pwd`/$1"
	echo $path
    start $applink $path
else
    start $applink $1 
fi