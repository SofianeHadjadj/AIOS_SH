#!/bin/bash

# Demande à l'utilisateur de choisir entre Docker et Machine virtuelle
echo "Choisissez le mode d'installation :"
echo "1. Docker"
echo "2. Machine virtuelle"
read -p "Votre choix (1 ou 2) : " choix

# Demande à l'utilisateur les informations de connexion à la base de données
read -p "Entrez l'hôte de la base de données (DB_HOST) : " DB_HOST
read -p "Entrez le nom d'utilisateur de la base de données (DB_USER) : " DB_USER
read -s -p "Entrez le mot de passe de la base de données (DB_PASSWORD) : " DB_PASSWORD
echo

# Étape 6 : Exposition des informations de connexion à l'application PHP
export DB_HOST=$DB_HOST
export DB_NAME=BananesExport
export DB_USER=$DB_USER
export DB_PASSWORD=$DB_PASSWORD

if [ "$choix" = "1" ]; then
    # Exécute le Dockerfile pour le déploiement dans un conteneur
    docker build -t bananes-export .
    if [ $? -eq 0 ]; then
        docker run -d -p 80:80 --name bananes-container bananes-export
        if [ $? -eq 0 ]; then
            echo "L'application BananesExport a été déployée dans un conteneur Docker."
        else
            echo "Erreur : Échec du démarrage du conteneur Docker."
            exit 1
        fi
    else
        echo "Erreur : Échec de la construction de l'image Docker."
        exit 1
    fi
elif [ "$choix" = "2" ]; then
    # Ajout des droits d'exécution au script
    chmod +x ./script/installation_machine.sh
    # Exécute le script Bash pour le déploiement sur une machine
    ./script/installation_machine.sh
    if [ $? -eq 0 ]; then
        echo "L'application BananesExport a été déployée sur la machine."
    else
        echo "Erreur : Échec du déploiement sur la machine."
        exit 1
    fi
else
    echo "Choix invalide."
    exit 1
fi
