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
	echo $backslash
	slash=`echo $1| grep -o '\/' `
	echo $slash

	if [[ -z $slash && -z $backslash ]];then
		return 0
	else
		return 1
	fi
}


export -f GetFileNameFromPath
export -f IsFilePath