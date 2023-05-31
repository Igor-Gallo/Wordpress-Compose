# Use a imagem do Ubuntu como base
FROM ubuntu:latest

# Defina variáveis de ambiente
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Sao_Paulo

# Atualize o sistema e instale dependências
RUN apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get install -y apache2 php libapache2-mod-php wget

# Habilitando o mod_rewrite do Apache
RUN a2enmod rewrite

# Adicione a diretiva ServerName ao arquivo de configuração do Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Instale o MySQL Client
RUN apt-get install -y mysql-client

# Baixe e instale o Wordpress
RUN apt-get install -y wget
RUN wget https://wordpress.org/latest.tar.gz

# Descompactar o Wordpress 
RUN tar -xvzf latest.tar.gz
RUN rm latest.tar.gz

# Mover Wordpress para o diretório de conteúdo da web
RUN mv wordpress/* /var/www/html/

# Remover o arquivo de configuração padrão do Wordpress
RUN rm /var/www/html/wp-config-sample.php

# Copie o arquivo de configuração personalizado do Wordpress
COPY wp-config.php /var/www/html/wp-config.php

# Exponha a porta 80 para o acesso ao Apache
EXPOSE 80

# Defina o comando de inicialização
CMD ["apache2ctl", "-D", "FOREGROUND"]