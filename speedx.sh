#!/system/bin/sh




#speedx termux menu
#developer
#by Tiago Olivv Canal



#speedx termux menu
#developer
#by Tiago Olivv Canal




#speedx termux menu
#developer
#by Tiago Olivv Canal





#speedx termux menu
#developer
#by Tiago Olivv Canal




#speedx termux menu
#developer
#by Tiago Olivv Canal




#speedx termux menu
#developer
#by Tiago Olivv Canal




#speedx termux menu
#developer
#by Tiago Olivv Canal




#speedx termux menu
#developer
#by Tiago Olivv Canal




#speedx termux menu
#developer
#by Tiago Olivv Canal





#speedx termux menu
#developer
#by Tiago Olivv Canal





#speedx termux menu
#developer
#by Tiago Olivv Canal





#speedx termux menu
#developer
#by Tiago Olivv Canal





#speedx termux menu
#developer
#by Tiago Olivv Canal





#speedx termux menu
#developer
#by Tiago Olivv Canal







#speedx termux menu
#developer
#by Tiago Olivv Canal





#speedx termux menu
#developer
#by Tiago Olivv Canal






#speedx termux menu
#developer
#by Tiago Olivv Canal







#speedx termux menu
#developer
#by Tiago Olivv Canal






























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































          











































































































                        menu_config() {
                  clear
                                                     if [ -f "../../../../../sdcard/.speedxtermux/database/motdx.txt" ]; then
                                    sleep 0.1
                  else
                                    mkdir ../../../../../sdcard/.speedxtermux/database/
                           echo "configuração inicial do termux sendo usada, este aquivo e a database 
by: speedx 
by: canal Tiago Olivv
" > ../../../../../sdcard/.speedxtermux/database/motdx.txt
        echo "
   ____   ___    ____   ____   ___    _  __    
  / __/  / _ \  / __/  / __/  / _ \  | |/_/  
 _\ \   / ___/ / _/   / _/   / // / _>  <    
/___/  /_/    /___/  /___/  /____/ /_/|_|  By: Tiago Olivv

digite -> sh speedx.sh para iniciar o menu do SpeedX 


" > ../usr/etc/motd
                                      fi

}
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
                                             termux-setup-storage
         clear
                   sleep 1
                                if [ -f "../../../../../sdcard/.speedxtermux/database/update.txt" ]; then
             echo
                            else
                                          yes | pkg update
                     echo "update atualizado !!! Tiago Olivv" > ../../../../../sdcard/.speedxtermux/database/update.txt
                                                   fi
                        if [ -f "../../../../../sdcard/.speedxtermux/database/update.txt" ]; then
                                                 echo
                                 else
                                                                 yes | pkg upgrade
                      echo "upgrade atualizado !!! Tiago Olivv" > ../../../../../sdcard/.speedxtermux/database/upgrade.txt
                                                                 fi

                          clear

                                              echo "update e upgrade finalizados com sucesso, instalando adb...
"
                                  sleep 1
           clear
                                 if [ -f "../../../../../sdcard/.speedxtermux/database/adb.txt" ]; then
                           echo
                                                     else
                     yes | pkg install android-tools 
                                              echo "android-tools atualizado !!! Tiago Olivv" > ../../../../../sdcard/.speedxtermux/database/adb.txt
                   fi
                                      sleep 1
                            clear
                                                        if [ -f "../../../../../sdcard/.speedxtermux/database/git.txt" ]; then
                                                  echo
                    else
                                                        yes | pkg install git 
                                     echo "git atualizado !!! Tiago Olivv" > ../../../../../sdcard/.speedxtermux/database/git.txt
                      fi
                                               clear
                                sleep 1
                                                            echo "digite a porta e o codigo separando por uma barra para parear o adb 

exemplo:340596 392652

caso não saiba como fazer, olhe o tutorial no youtube!!!

"

                                                                    read porta_codigo
                                   adb pair localhost:$porta_codigo
                                                                          sleep 0.5
                                                                clear
                                             echo "digite a porta para conectar o adb 


exemplo:34985

"
                                                          read porta
                        adb connect localhost:$porta
                                                                    sleep 0.5
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
    sleep 1
                                                                     else
                         git clone https://github.com/tg230/speedxtermux /sdcard/atualização/
                                                                   mv /sdcard/atualização/speedx.sh /sdcard/.speedxtermux/
                    rm -r /sdcard/atualização
                                                          fi
                                                      clear
          sleep 0.5
                                    if adb shell sh sdcard/.speedxtermux/speedx.sh; then
    echo
                     else
                                                clear
                                                                echo "ERRO 307 - ocorreu algum erro ao inicializar o script, por favor comunique no telegram de suporte !!!"
                                   sleep 4
                                                     update_menu
                fi

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
                               if adb shell sh sdcard/.speedxtermux/speedx.sh; then
                      echo
             else
                                  clear
                        echo "ERRO 307 - ocorreu algum erro ao inicializar o script, por favor comunique no telegram de suporte !!!"
              sleep 4
    update_menu
                        fi
}
                ajuda() {
                                     clear
                 echo -n "

AJUDA

opção 1  baixar todas dependencias irá baixar o adb, o git e configurar todo o termux, caso você ja tenha feito isso, não precisa executar novamente

opção 2  apenas atualizar ira atualizar o script para a versão mais atual, se não tiver versão mais atual ele irá apenas rebaixar a versão que ja estava

opção 3  parear ADB, caso tenha dado falha na primeira opção ou caso você tenha despareado sem querer, você pode parear novamente

opção 4  executar ira executar o script


0- voltar ao menu


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
                                       update_check() {
                    versao_arquivo=$(curl -s -L https://raw.githubusercontent.com/tg230/teste2222/main/vers%C3%A3o.txt)
                                         versao_script="1.0.8"
                                       clear
                                                           echo "procurando atualizações"
                   sleep 2.0
                                          clear
                                      if [ "$versao_arquivo" != "$versao_script" ]; then
    echo "A versão do menu não corresponde à versão do script. Atualizando..."
                                    sleep 1.0
                       rm -r speedx.sh
                                      sleep 1.0
                  curl -O https://raw.githubusercontent.com/tg230/teste2222/main/speedx.sh
                            clear
      sleep 0.5
               echo "Menu atualizado com sucesso! reiniciando..."
               sleep 1.0
                                       clear
                                                 exec sh "$0"
else
                               echo "Sua versão do menu está atualizada."
                   sleep 1.0
                                            update_menu
fi

}
                                  home() {
                                             if curl -s -L https://raw.githubusercontent.com/tg230/teste2222/main/vers%C3%A3o.txt; then
                 update_check
                                                else
              echo "Sem conexão à internet. Não é possível verificar atualizações."
                                  sleep 2.0
                                                     update_menu
                               fi
}
                                                     menu_config
                   home
