FROM python:3.10-slim

# Installation des dépendances système (ffmpeg pour la vidéo)
RUN apt-get update && apt-get install -y ffmpeg git && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Installation directe de toutes les bibliothèques Python
RUN pip install --no-cache-dir --break-system-packages flask yt-dlp moviepy openai-whisper flask-cors

COPY . .

CMD ["python", "app.py"]
