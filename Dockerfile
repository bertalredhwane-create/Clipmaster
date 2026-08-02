FROM python:3.10-slim

# Installation des dépendances système (ffmpeg pour la vidéo)
RUN apt-get update && apt-get install -y ffmpeg git && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Installation directe de toutes les bibliothèques Python
RUN pip install --no-cache-dir --upgrade pip yt-dlp flask flask-cors moviepy openai-whisper


COPY . .

CMD ["python", "app.py"]
