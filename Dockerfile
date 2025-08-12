# Imagen base con Python 3.11
FROM python:3.11-slim

# Evitar buffers en la salida
ENV PYTHONUNBUFFERED=1

# Crear directorio de la app
WORKDIR /app

# Copiar dependencias y app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Puerto que usará Flask
ENV PORT=5000

# Ejecutar con Gunicorn para producción
CMD gunicorn --bind 0.0.0.0:$PORT app:app --workers 4 --threads 8 --timeout 0
