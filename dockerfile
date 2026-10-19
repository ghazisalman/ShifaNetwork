FROM python:3.12-slim

WORKDIR /app
ENV PYTHONUNBUFFERED=1

# Install Python dependencies (cached unless requirements.txt changes)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the source (the compose volume will overlay this at runtime)
COPY . .

EXPOSE 8000

# Static site for now: serves everything in /app
CMD ["python", "-m", "http.server", "8000", "--bind", "0.0.0.0"]