FROM python:3.9

RUN apt-get update && apt-get install -y ffmpeg

WORKDIR /app

COPY . /app

CMD ["python", "app.py"]
