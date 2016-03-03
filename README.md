# Instalar Ionic no Fedora 64b usando Proxy

Depois de muita pesquisa, consegui instalar o Ionic no Fedora
em uma rede que usa proxy.
Criei esse script para automatizar o processo a quem precisar.

No inicio do arquivo tem uma variavél para setar o proxy da rede,
caso o proxy mude, é só configurar a variavél.


Dar permissão de execução ao arquivo

	$ chmod +x ionic_install_fedora_64.sh

Executar como root o arquivo

	$ ./ionic_install_fedora_64.sh

No próprio script tem uma descrição de tudo que será feito, segue um resumo.

- Remover qualquer instalação do NodeJS

- Instalação dos programas: wget, git, npm

- Instalação do NodeJS 0.12

- Configurar proxy para o npm

- Instalação do Android SDK

- Instalação do Cordova

- Instalação do Ionic

- Instalação do Java

- Configuração de todas as variáveis de ambiente e programas necessários: node, android, ANDROID_HOME, JAVA_HOME


Após rodar o script ainda é preciso instalar manualmente as APIs do Android para gerar o build dos aplicativos.

para isso abra o terminal como root e digite

	$ android

baixar os packages da ultima versão da API, SDK Build-tools, SDK tools e o Extra Android Support Library



 Criar novo projeto

É preciso setar o proxy para o comando ionic.

para o ionic funcione de maneira automatica
incluir no arquivo

/opt/node-v0.12.1-linux-x64/lib/node_modules/ionic/node_modules/request/request.js


colocar na linha 419 abaixo da sequinte linha

	if (self.strictSSL === false) {
	 self.rejectUnauthorized = false
	}

	 self.proxy = 'http://192.168.25.2:3128';


ou usar no próprio comando ionic passando o proxy
Ex:

	$ PROXY=http://192.168.25.2:3128 ionic start aplicativo tabs
