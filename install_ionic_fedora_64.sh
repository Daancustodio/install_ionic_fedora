#!/bin/bash
# Created by Jones Heckler
# mw10@mw10.com.br
# Script para instalação e configuração do IONIC em Fedora 64bits.

# EXECUTAR ESSE SCRIPT COM O USUARIO root

# variavel para configurar o proxy
varproxy="http://192.168.1.1:3128"

export http_proxy=$varproxy
export https_proxy=$varproxy

# Remover qualquer instalação do Nodejs  e npm presente na maquina.
yum erase nodejs npm
rm -rf /usr/lib/node_modules


# instalação de pacotes basicos necessarios.
dnf install wget npm git


# instalar NODEJS 0.12 e setar variavel $PATH

cd /opt
wget http://nodejs.org/dist/v0.12.1/node-v0.12.1-linux-x64.tar.gz
tar xvf node-v0.12.1-linux-x64.tar.gz
chown -R root:root node-v0.12.1-linux-x64
echo "export PATH=\$PATH:/opt/node-v0.12.1-linux-x64/bin" >> ~/.bashrc
echo "alias nodejs='node'" >> ~/.bash_profile


# Configurar NPM para usar o proxy da empresa.
npm config set proxy $varproxy
npm config set https-proxy $varproxy


# instalar ANDROID SDK e configurar variaveis de ambiente
wget http://dl.google.com/android/android-sdk_r24.2-linux.tgz
tar zxf android-sdk_r24.2-linux.tgz
chown -R root:root android-sdk-linux/
echo "export ANDROID_HOME=/opt/android-sdk-linux/" >> ~/.bashrc
echo "export PATH=$PATH:/opt/android-sdk-linux/tools" >> ~/.bashrc
source ~/.bashrc


# instalar CORDOVA e IONIC
npm install -g cordova
npm install -g ionic



# setar o proxy para o ionic funcione de maneira automatica
# incluir no arquivo /opt/node-v0.12.1-linux-x64/lib/node_modules/ionic/node_modules/request/request.js
# colocar na linha 419
# abaixo da sequinte linha

#    if (self.strictSSL === false) {
#      self.rejectUnauthorized = false
#    }

#    self.proxy = 'http://192.168.1.1:3128';

# ou usar no proprio comando ionic passando o proxy

# Ex: $  PROXY=http://192.168.1.1:3128 ionic start aplicativo tabs



# Instalar JAVA SDK

wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u73-b02/jdk-8u73-linux-x64.rpm
rpm -ivh jdk-8u73-linux-x64.rpm


# Setar variaveis de ambiente para o JAVA

echo "export JAVA_HOME=/usr/java/default/" >> ~/.bashrc
echo "export PATH=$JAVA_HOME/bin:$PATH" >> ~/.bashrc
source ~/.bashrc


# instalar dependencia do android
# rodar o comando no terminal como root
# $ android
# baixar os packages da ultima versão da API, SDK Build-tools, SDK tools e o Extra Android Support Library
