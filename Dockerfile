FROM python:3.9-slim

# Installation de ffmpeg et des dépendances système nécessaires
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copie et installation des dépendances Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copie du reste des fichiers de l'application
COPY . .

EXPOSE 10000

CMD ["python", "app.py"]
