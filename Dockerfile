# Utiliser l'image officielle Nginx comme base
FROM nginx:alpine

# Copier le fichier index.html dans le répertoire de travail de Nginx
COPY index.html /usr/share/nginx/html/index.html

# Exposer le port 80 pour accéder à la page web
EXPOSE 80
