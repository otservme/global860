#!/bin/bash

apt-get -y install nano autoconf libboost-all-dev libgmp-dev liblua5.1-0 liblua5.1-0-dev liblua50 liblua50-dev liblualib50 liblualib50-dev lua50 lua5.1 libxml2-dev libxml++2.6-dev libmysql++-dev libsqlite0-dev libsqlite3-dev build-essential apache2-utils
wget https://github.com/otservme/global860/archive/master.zip
unzip master.zip -d /home/otserv/ && unzip /home/otserv/global860-master/data/world.zip -d /home/otserv/global860-master/data/
rm master.zip;
cd /home/otserv/global860-master/sources;
rm *.o; rm theforgottenserver; chmod 777 autogen.sh; chmod 777 build.sh; ./autogen.sh; ./configure --enable-server-diag --enable-mysql --enable-root-permission; ./build.sh;
cp theforgottenserver ../; cd ..;
chmod 777 theforgottenserver tfsAutoRestarter.sh;
chown -R www-data.www-data /home/otserv;
echo "Pronto, instalado com sucesso!"
