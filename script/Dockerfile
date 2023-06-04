FROM php:7.4-apache

# Copie des fichiers PHP vers le répertoire du serveur Apache
COPY app/ /var/www/html/

# Installation des dépendances 
RUN docker-php-ext-install mysqli

# Copiez le fichier SQL de création de la base de données dans le conteneur
COPY schema.sql /docker-entrypoint-initdb.d/

# Configurez les variables d'environnement pour la connexion à la base de données
ENV DB_HOST=$DB_HOST
ENV DB_NAME BananesExport
ENV DB_USER=$DB_USER
ENV DB_PASSWORD=$DB_PASSWORD

# Port 80 pour accéder à l'application
EXPOSE 80