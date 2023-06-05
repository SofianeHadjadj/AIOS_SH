#!/bin/bash

# Mise à jour du système
sudo apt update
sudo apt upgrade -y

# Installation du serveur web Apache
sudo apt install apache2 -y

# Installation de PHP 7 et des extensions requises
sudo apt install php7.4 libapache2-mod-php7.4 php7.4-mysql php7.4-curl php7.4-gd php7.4-mbstring php7.4-xml -y

# Installation du serveur de base de données MySQL
sudo apt install mysql-server -y

# Configuration de la base de données MySQL
sudo mysql_secure_installation

# Activation des modules Apache nécessaires pour PHP
sudo a2enmod php7.4
sudo service apache2 restart

# Création de la base de données
mysql -u root -p -e "CREATE DATABASE BananesExport;"

# Création de l'utilisateur et attribution des droits sur la base de données
mysql -u root -p -e "CREATE USER '$DB_USER'@'$DB_HOST' IDENTIFIED BY '$DB_PASSWORD';"
mysql -u root -p -e "GRANT ALL PRIVILEGES ON BananesExport.* TO '$DB_USER'@'$DB_HOST';"
mysql -u root -p -e "FLUSH PRIVILEGES;"

echo "La base de données 'BananesExport' a été créée avec succès."
echo "L'utilisateur '$DB_USER' a été créé avec les droits sur la base de données."

# Création automatisée du schéma de base de données MySQL
mysql -u $DB_USER -p$DB_PASSWORD -e "CREATE DATABASE BananesExport;"
mysql -u $DB_USER -p$DB_PASSWORD BananesExport < schema.sql

# Récupération du code source depuis GitLab
git clone https://gitlab.com/aios-sh/BananesExport.git

# Déplacement des fichiers PHP vers le répertoire app
mv BananesExport/Deploy/app/* /var/www/html/