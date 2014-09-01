#!/bin/bash

wget https://github.com/otservme/global860/archive/master.zip
unzip master.zip -d /home/otserv/;
cd /home/otserv/global860-master/sources;
rm *.o; rm theforgottenserver; chmod 777 autogen.sh; chmod 777 build.sh; ./autogen.sh; ./configure --enable-server-diag --enable-mysql --enable-root-permission; ./build.sh;
cp theforgottenserver ../; cd ..;
chmod 777 theforgottenserver tfsAutoRestarter.sh;
chown -R www-data.www-data /home/otserv;
echo "Pronto, instalado com sucesso!"
