FROM python:3.10-slim

WORKDIR /app

RUN pip install --no-cache-dir --break-system-packages flask

COPY . /app

CMD ["python", "app.py"]
