FROM python:3.9

# Installation de FFmpeg
RUN apt-get update && apt-get install -y ffmpeg

WORKDIR /app

# Copie des fichiers
COPY . /app

# Installation des dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Lancement de l'application
CMD ["python", "app.py"]
