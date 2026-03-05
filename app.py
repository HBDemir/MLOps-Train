from fastapi import FastAPI
import random

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Finansal Veri API'sine Hoş Geldiniz! EPS tahmini için /eps-predict endpoint'ini kullanın."}

@app.get("/eps-predict")
def get_eps_prediction():
    # 1.0 ile 5.0 arasında rastgele bir EPS (Hisse Başına Kar) değeri üretiyoruz
    predicted_eps = round(random.uniform(1.0, 5.0), 2)
    return {
        "ticker": "TECH-AI",
        "predicted_eps": predicted_eps,
        "version": "v3" # BURAYI v3 YAPTIK
    }