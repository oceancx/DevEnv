git config --global url.https://github.com/.insteadOf git://github.com/
git config --global http.proxy 'socks5://127.0.0.1:7070'

git config --global http.proxy socks5h://127.0.0.1:1080


(Just a little reminder) If you want the hostname also be resolved by the proxy (that means passing everything through the proxy), especially when you are cloning a gist, you can use the following setting (the key is that it uses socks5h instead of socks5):

git config --global http.proxy socks5h://127.0.0.1:1080

https://stackoverflow.com/questions/15227130/using-a-socks-proxy-with-git-for-the-http-transport

git config --global https.proxy http://127.0.0.1:1080

git config --global https.proxy https://127.0.0.1:1080

git config --global --unset http.proxy

git config --global --unset https.proxy


https://gist.github.com/laispace/666dd7b27e9116faece6