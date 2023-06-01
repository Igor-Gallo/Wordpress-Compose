# 1. Use a imagem base do Ubuntu
FROM ubuntu:latest

# 2. Atualize e instale as dependências
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:nginx/stable && \
    apt-get update && \
    apt-get install -y nginx vim wget curl php7.4-fpm php7.4-mysql php7.4-gd php7.4-xml php7.4-mbstring sendmail

# 3. Baixe o WordPress
RUN wget -c http://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    rm latest.tar.gz

# 4. Configure o PHP
RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php/7.4/fpm/php.ini && \
    sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 127.0.0.1:9000/' /etc/php/7.4/fpm/pool.d/www.conf && \
    sed -i 's/;sendmail_path =/sendmail_path = \/usr\/sbin\/sendmail -t -i/' /etc/php/7.4/fpm/php.ini

# 5. Configure o NGINX
COPY my-site.conf /etc/nginx/conf.d/default.conf
RUN unlink /etc/nginx/sites-enabled/default

# 6. Copie o WordPress para o diretório correto
RUN cp -R /wordpress/* /var/www/html/

# 7. Corrija as permissões
RUN chown -R www-data:www-data /var/www/html/

# 8. Configure o volume para persistência
VOLUME /var/www/html

# 9. Expose ports
EXPOSE 80

# 10. Inicie os serviços
CMD service nginx start && service php7.4-fpm start
