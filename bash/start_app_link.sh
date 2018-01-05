##判断$1是路径 还是文件名
source ~/.bash_rc
applink=$2
start $applink `GetPath $1`
