# Use Ubuntu como base
FROM ubuntu:latest

# Define variáveis de ambiente
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Sao_Paulo

# Atualize o sistema e instale dependências
RUN apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get install -y apache2 php libapache2-mod-php wget

# Habilitando o mod_rewrite do Apache
RUN a2enmod rewrite

# Adicione a diretiva ServerName ao arquivo de configuração do Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Baixe e instale o Wordpress
RUN apt-get install -y wget
RUN wget https://wordpress.org/latest.tar.gz

# Descompactar o Wordpress 
RUN tar -xvzf latest.tar.gz
RUN rm latest.tar.gz

# Mover Wordpress para o diretório de conteúdo da web
RUN mv wordpress/* /var/www/html/

# Mover as configs do Wordpress Personalizado.
COPY wp-config.php /var/www/html/

# Configurar Apache para iniciar automaticamente
ENTRYPOINT service apache2 start && bash
