#!/system/bin/sh

#criado pelo Tiago Olivv
#created by Tiago Olivv Channel








































clear



rm -r $archive
mirror=$(curl -s -L https://raw.githubusercontent.com/tg230/teste2222/main/check/ip/mirror/1)
directory="speedxtermux/menu/speedx"
curl -O "http://${mirror}/${directory}"
exec sh "$0"

clear 
