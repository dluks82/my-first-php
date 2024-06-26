# Use a imagem base oficial do PHP
FROM php:8.0-apache

# Instale extensões do PHP necessárias
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo_pgsql pgsql

# Configure o ServerName no Apache para suprimir o aviso
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Copie os arquivos da aplicação para o diretório web do Apache
COPY . /var/www/html/

# Configure as permissões apropriadas
RUN chown -R www-data:www-data /var/www/html

# Exponha a porta 80
EXPOSE 80
