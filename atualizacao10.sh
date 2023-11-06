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
  adb_parear
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
termux-setup-storage

echo "aperte enter ou digite Y toda vez que aparecer para você confirmar algo !!!"
sleep 3.0
pkg update && pkg upgrade 
clear
echo "update e upgrade finalizados com sucesso, instalando adb...
"
sleep 3.0
clear
pkg install android-tools 

clear
echo "ADB instalado com sucesso, instalando git...
"
sleep 3.0
clear
pkg install git
clear
echo "git instalado com sucesso, indo para configuração do ADB...
"
sleep 3.0
clear
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

sleep 0.5 

cd ../../../../../sdcard && git clone https://github.com/tg230/speedxtermux

adb shell sh sdcard/speedxtermux/speedx.sh

}




update() {


clear

git clone https://github.com/tg230/speedxtermux /sdcard/atualização/
sleep 1.0


mv /sdcard/atualização/speedx.sh /sdcard/speedxtermux/
sleep 1.0


rm -r /sdcard/atualização
sleep 1.0

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
adb shell sh sdcard/speedxtermux/speedx.sh
}












ajuda() {
clear


echo -n "

                                ${purple}AJUDA

1- baixar todas dependencias irá baixar o adb, o git e configurar todo o termux, caso você ja tenha feito isso, não precisa executar novamente

2- apenas atualizar ira atualizar o script para a versão mais atual, se não tiver versão mais atual ele irá apenas rebaixar a versão que ja estava

3- parear ADB, caso tenha dado falha na primeira opção ou caso você tenha despareado sem querer, você pode parear novamente

4- executar ira executar o script, simples


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
