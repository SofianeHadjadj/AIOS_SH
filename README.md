## Deploy.sh

Ce script permet de déployer l'application BananesExport en offrant la flexibilité de choisir entre deux modes d'installation : Docker ou Machine. Selon le choix de l'utilisateur, le script exécute le déploiement dans un conteneur Docker ou sur une machine physique/virtuelle.

### Options disponibles

- L'utilisateur est invité à choisir entre Docker et Machine en saisissant le numéro correspondant.
- Si l'utilisateur choisit Docker (1), le script exécute les étapes suivantes :
    1. Construit une image Docker à partir du Dockerfile (`docker build -t bananes-export .`).
    2. Lance un conteneur à partir de l'image, en mappant le port 80 du conteneur sur le port 80 de la machine hôte (`docker run -d -p 80:80 --name bananes-container bananes-export`).
    3. Affiche un message indiquant que l'application BananesExport a été déployée dans un conteneur Docker.

- Si l'utilisateur choisit Machine (2), le script exécute les étapes suivantes :
    1. Exécute le script d'installation `installation_machine.sh` qui réalise les étapes de déploiement sur une machine.
    2. Affiche un message indiquant que l'application BananesExport a été déployée sur la machine.

### Utilisation

1. Ouvrir une fenêtre de terminal.
2. Accéder au répertoire contenant le script `deploy.sh`.
3. Exécuter la commande suivante : `./deploy.sh`
4. Suivre les instructions à l'écran et saisir le numéro correspondant au mode d'installation souhaité (Docker ou Machine).
5. Le script exécutera les étapes de déploiement appropriées en fonction du choix de l'utilisateur.

### Exemple d'utilisation

$ ./deploy.sh

Choisissez le mode d'installation :

Docker
Machine
Votre choix (1 ou 2) : 1
[... Building Docker image ...]
[... Running Docker container ...]

L'application BananesExport a été déployée dans un conteneur Docker.

### Notes

- Assurez-vous d'avoir Docker installé et configuré correctement sur votre machine si vous choisissez le mode Docker.
- Si vous choisissez le mode Machine, assurez-vous que les dépendances requises (PHP, Apache, MySQL, etc.) sont déjà installées sur votre machine.
