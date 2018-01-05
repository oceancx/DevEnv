function GetFileNameFromPath()
{
	path=$1
	#echo $path
	oldIFS=$IFS
	IFS=/
	lastItem=''
	for item in $1;
	do
		lastItem=$item
	done
	#echo "lastItem:${lastItem}"
	IFS=$oldIFS
	name=${lastItem%.*}
	echo $name
	#return $name
}

function IsFilePath()
{
	backslash=`echo $1| grep -o '\\\' `
	# echo $backslash
	slash=`echo $1| grep -o '\/' `
	# echo $slash

	if [[ -z $slash && -z $backslash ]];then
		echo 0
	else
		echo 1
	fi
}

#参数是linuxPath 如果以/开头 那么就是rootPath
function IsRelativePath()
{
	# echo  $path
	#如果开始为C:\\	或者 里面包含 \\ 或者 \的话
	matchResult=`echo $1| grep  -o -E '^\/' `
	if [[ -z $matchResult ]];then
		echo 1
	else
		echo 0
	fi	
}


function IsWindowsPath()
{
	#如果开始为C:\ 或者 里面包含 \
	backslash=`echo $1| grep -o -E '^[A-Za-z]:' `
	if [[ -z $backslash ]];then
		echo 0
	else
		echo 1
	fi	
}

#将windowsPath转化为linuxPath，如果开头是字母的话 要加/ 另外其他所有的\\或者\ 要转换成/
function HandleWindowsPathPrivate()
{
	
	echo $1 | sed 's/\([A-Za-z]\):/\/\1/' | sed 's/\\/\//g'
	
}

function HandleLinuxPathPrivate()
{
	
	echo $1 | sed 's/\/\([A-Za-z]\)/\1:/' | sed 's/\//\\/g'
	
}

function HandleWindowsPath()
{
	# path= echo $1 | sed 's/ /\ /g'
	path=$1
	# echo $path
	path=`HandleWindowsPathPrivate "$path"`
	# path= echo $path | sed 's/\ / /g'
	echo $path
}

function TogglePath()
{
	res=`IsWindowsPath $1`
	if [[ $res -eq 1 ]]; then
		finalPath=`HandleWindowsPathPrivate "$1"`
	else
		finalPath=`HandleLinuxPathPrivate "$1"`
	fi
	echo $finalPath
}

#解析 C:// 或者 /c/ 或者 . 或者 .. 或者 文件名
function GetPath()
{

	finalPath=''
	if [[ $1 == '.' ]];then
		finalPath=`pwd`
	elif [[ $1 == '..' ]]; then
		finalPath=`cd ..;pwd`
	else
		# echo $1
		res=`IsWindowsPath $1`
		if [[ $res -eq 1 ]]; then
			finalPath=`HandleWindowsPathPrivate "$1"`
		else
			finalPath=$1
		fi
		# echo $finalPath
		res=`IsRelativePath "$finalPath"`
		if [[ $res -eq 1 ]]; then
			finalPath=`pwd`"/${finalPath}"
		fi
	fi
	echo "$finalPath"
}


export -f GetFileNameFromPath
export -f IsFilePath
export -f HandleWindowsPath
export -f IsRelativePath
export -f GetPath
export -f TogglePath