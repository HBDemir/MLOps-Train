# 1. Resmi ve hafif (slim) bir Python imajı kullanıyoruz
FROM python:3.9-slim

# 2. Konteyner içindeki çalışma dizinini ayarlıyoruz
WORKDIR /app

# 3. Önce sadece requirements.txt'yi kopyalayıp bağımlılıkları kuruyoruz (Docker cache'ini verimli kullanmak için)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Uygulamanın geri kalan kodlarını konteynere kopyalıyoruz
COPY . .

# 5. Konteynerin 8080 portundan dinleyeceğini belirtiyoruz
EXPOSE 8080

# 6. Uvicorn sunucusunu başlatarak FastAPI uygulamasını ayağa kaldırıyoruz
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8080"]