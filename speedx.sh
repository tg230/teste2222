#!/system/bin/sh

update_menu() {
clear
echo -n "
   ____   ___    ____   ____   ___    _  __     
  / __/  / _ \  / __/  / __/  / _ \  | |/_/    
 _\ \   / ___/ / _/   / _/   / // / _>  <     
/___/  /_/    /___/  /___/  /____/ /_/|_|     
                                            
     ___    ___    ____   __ __
    / _ \  / _ |  / __/  / // /
   / // / / __ | _\ \   / _  / 
  /____/ /_/ |_|/___/  /_//_/   by: Tiago Olivv


 ===================================================
|      Menu de configuração do SpeedX termux        |
 ===================================================

[ 1 ] baixar todas dependencias
[ 2 ] apenas atualizar
[ 3 ] parear ADB ou conectar ADB
[ 4 ] executar SpeedX
[ 0 ] ajuda 

"
read opcao
case $opcao in
1)
dependencies
;;
2)
update
;;
3) 
adb_menu
;;
4)
executar
;;
0)
ajuda
;;
*)
update_menu
;;
esac
}
dependencies() { 
clear
echo "aperte enter ou digite Y toda vez que aparecer para você confirmar algo !!!"
sleep 3.0
pkg update && pkg upgrade 
clear
echo "update e upgrade finalizados com sucesso, instalando adb...
"
sleep 3.0
clear
if pkg search android-tools; then
echo "você ja tem o ADB instalado!!!, prosseguindo"
sleep 3.0
clear
else
echo "instalando adb"
pkg install android-tools 
clear
echo "ADB instalado com sucesso, instalando git...
"
sleep 3.0
clear
fi
if pkg search git; then
echo "você ja tem o git instalado!!!, prosseguindo"
sleep 3.0
clear
else
echo "instalando git"
pkg install git
clear
echo "git instalado com sucesso, prosseguindo..."
sleep 3.0
clear
fi
echo "digite a porta e o codigo separando por uma barra 

exemplo:340596 392652

caso não saiba como fazer, olhe o tutorial no youtube!!!

"
read porta_codigo
adb pair localhost:$porta_codigo
sleep 0.5
echo "digite a porta para conectar o adb 

exemplo:34985

"
read porta
adb connect localhost:$porta
sleep 2.0
clear
if [ -d "../../../../../sdcard/speedxtermux/" ]; then
rm -r ../../../../../sdcard/speedxtermux/
else
sleep 0.5
fi
if [ -d "../../../../../sdcard/.speedxtermux/" ]; then
sleep 0.5
else
mkdir ../../../../../sdcard/.speedxtermux/
fi
if [ -f "../../../../../sdcard/.speedxtermux/speedx.sh" ]; then
echo "você já tem o speedx instalado... executando"
sleep 2.0
else
git clone https://github.com/tg230/speedxtermux /sdcard/atualização/
mv /sdcard/atualização/speedx.sh /sdcard/.speedxtermux/
rm -r /sdcard/atualização
fi
adb shell sh sdcard/.speedxtermux/speedx.sh
}
update() {
clear
echo "baixando atualização..."
sleep 0.5
echo ""
git clone https://github.com/tg230/speedxtermux /sdcard/atualização/
sleep 1.0
clear
if [ -d "../../../../../sdcard/speedxtermux/" ]; then
rm -r ../../../../../sdcard/speedxtermux/
else
sleep 0.5
fi
if [ -d "../../../../../sdcard/.speedxtermux/" ]; then
sleep 0.5
else
mkdir ../../../../../sdcard/.speedxtermux/
fi
echo "instalando atualização..."
sleep 0.5
echo ""
mv /sdcard/atualização/speedx.sh /sdcard/.speedxtermux/
sleep 1.0
clear
echo "apagando arquivos antigos..."
sleep 0.5
echo ""
rm -r /sdcard/atualização
sleep 2.0
clear
echo "SpeedX atualizado!!! voltando para o menu..."
sleep 3.0
update_menu
}
adb_menu() {
clear
echo -n "

 ===================================================
|               Selecione uma opção                 |
 ===================================================

[ 1 ] apenas conectar
[ 2 ] parear e conectar 
[ 0 ] voltar ao menu 

"
read opcao
case $opcao in
1)
adb_conectar
;;
2)
adb_parear
;;
0)
update_menu
;;
*)
adb_menu
;;
esac
}
adb_conectar() {
clear
echo "

digite a porta para conectar o adb 

exemplo:34985

"
read porta
adb connect localhost:$porta
update_menu
}
adb_parear() {
clear
echo "
digite a porta e o codigo separado

exemplo:40596 392652

"
read porta_codigo
adb pair localhost:$porta_codigo
sleep 1.0
adb_conectar
}
executar(){
clear
adb shell sh sdcard/.speedxtermux/speedx.sh
}
ajuda() {
clear
echo -n "

AJUDA

1- baixar todas dependencias irá baixar o adb, o git e configurar todo o termux, caso você ja tenha feito isso, não precisa executar novamente

2- apenas atualizar ira atualizar o script para a versão mais atual, se não tiver versão mais atual ele irá apenas rebaixar a versão que ja estava

3- parear ADB, caso tenha dado falha na primeira opção ou caso você tenha despareado sem querer, você pode parear novamente

4- executar ira executar o script


0. voltar ao menu


"
read opcao
case $opcao in
0)
update_menu
;;
*)
ajuda
;;
esac
}
update_menu
