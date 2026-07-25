from fastapi import FastAPI
from pydantic import BaseModel
from datetime import datetime

app = FastAPI(
    title="CloudForge Platform API",
    description="Portfolio API for the CloudForge AI Platform.",
    version="1.0.0",
)

class InferenceRequest(BaseModel):
    prompt: str

@app.get("/")
def root():
    return {
        "service": "cloudforge-platform-api",
        "status": "running",
        "timestamp": datetime.utcnow().isoformat()
    }

@app.get("/health")
def health():
    return {"status": "healthy"}

@app.post("/inference")
def inference(request: InferenceRequest):
    # Demo endpoint only. Replace with a real model integration later.
    return {
        "input": request.prompt,
        "result": f"Demo response for: {request.prompt}",
        "model": "demo-inference-v1"
    }
