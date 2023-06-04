#!/bin/bash

# Étape 1 : Récupération du code source depuis GitLab
git clone https://gitlab.com/aios-sh/BananesExport.git

# Étape 2 : Déplacement des fichiers PHP vers le répertoire app
mv BananesExport/Deploy/app/* app/

# Étape 3 : Création automatisée du schéma de base de données MySQL
mysql -u <nom_utilisateur> -p<mot_de_passe> -e "CREATE DATABASE BananesExport;"
mysql -u <nom_utilisateur> -p<mot_de_passe> BananesExport < schema.sql

# Étape 4 : Installation du serveur de présentation basé sur PHP (Apache)
apt-get update
apt-get install apache2

# Étape 5 : Installation de la base de données MySQL
apt-get install mysql-server

# Étape 6 : Exposition des informations de connexion à l'application PHP
export DB_HOST=$DB_HOST
export DB_NAME=BananesExport
export DB_USER=$DB_USER
export DB_PASSWORD=$DB_PASSWORD

# Étape 7 : Vérification du déploiement
systemctl start apache2
curl localhost:80/AIOS_SH