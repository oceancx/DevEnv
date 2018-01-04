declare -A AddressMap
AddressMap=(
    [github]=www.github.com
    [baidu]=www.baidu.com
	[bilibili]=www.bilibili.com
	[google]=www.google.com
	[linkedin]=www.linkedin.com
	[weibo]=www.weibo.com
	[youtube]=www.youtube.com
	[zhihu]=www.zhihu.com
)

if [[ -z ${AddressMap[$1]} ]];
then
    echo $1;
    start chrome $1;
else
    echo ${AddressMap[$1]};
    start chrome ${AddressMap[$1]};
fi

