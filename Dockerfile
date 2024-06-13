# Use a imagem base oficial do PHP
FROM php:8.0-apache

# Instale extensões do PHP necessárias
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo_pgsql

# Copie os arquivos da aplicação para o diretório web do Apache
COPY . /var/www/html/

# Configure as permissões apropriadas
RUN chown -R www-data:www-data /var/www/html
