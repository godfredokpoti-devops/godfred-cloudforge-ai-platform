from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title="CloudForge Inference Service", version="1.0.0")

class PredictRequest(BaseModel):
    text: str

@app.get("/health")
def health():
    return {"status": "healthy"}

@app.post("/predict")
def predict(request: PredictRequest):
    return {
        "prediction": "demo_class",
        "confidence": 0.92,
        "input": request.text
    }
