FROM python:3.9

# Installation de FFmpeg pour la vidéo
RUN apt-get update && apt-get install -y ffmpeg

# Définir le dossier de travail
WORKDIR /app

# Copier les fichiers du projet
COPY . /app

# Installer les dépendances Python (on les définira juste après)
RUN pip install -r requirements.txt

# Lancer le serveur (on va créer le fichier app.py ensuite)
CMD ["python", "app.py"]
