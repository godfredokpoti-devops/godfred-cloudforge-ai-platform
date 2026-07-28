import uuid
from contextlib import asynccontextmanager
from datetime import datetime, timezone
from typing import AsyncIterator

from fastapi import FastAPI
from pydantic import BaseModel, ConfigDict, Field

from app.config import settings
from app.logger import logger


@asynccontextmanager
async def lifespan(_: FastAPI) -> AsyncIterator[None]:
    logger.info("=" * 60)
    logger.info("CloudForge Inference Service starting")
    logger.info("Application: %s", settings.app_name)
    logger.info("Version: %s", settings.app_version)
    logger.info("Environment: %s", settings.environment)
    logger.info("Model: %s", settings.model_name)
    logger.info("Model release: %s", settings.model_release)
    logger.info("=" * 60)

    yield

    logger.info("CloudForge Inference Service shutting down")


app = FastAPI(
    title=settings.app_name,
    version=settings.app_version,
    description=(
        "Production-oriented inference service for the "
        "CloudForge AI Platform."
    ),
    lifespan=lifespan,
)


class PredictRequest(BaseModel):
    text: str = Field(
        ...,
        min_length=3,
        max_length=1000,
        description="Text submitted for inference",
    )


class PredictResponse(BaseModel):
    model_config = ConfigDict(
        protected_namespaces=(),
    )

    prediction: str
    confidence: float
    input: str
    model_release: str
    request_id: str
    timestamp: str
    environment: str


@app.get(
    "/health",
    tags=["Health"],
    summary="Check service health",
)
def health() -> dict[str, str]:
    return {
        "status": "healthy",
        "service": settings.app_name,
        "version": settings.app_version,
        "environment": settings.environment,
    }


@app.get(
    "/ready",
    tags=["Health"],
    summary="Check service readiness",
)
def readiness() -> dict[str, str]:
    return {
        "status": "ready",
        "service": settings.app_name,
        "model": settings.model_name,
        "model_release": settings.model_release,
        "environment": settings.environment,
    }


@app.post(
    "/predict",
    response_model=PredictResponse,
    summary="Run inference against the configured model",
    tags=["Inference"],
)
def predict(request: PredictRequest) -> PredictResponse:
    request_id = str(uuid.uuid4())

    logger.info(
        "Prediction request received | request_id=%s | input_length=%s",
        request_id,
        len(request.text),
    )

    timestamp = (
        datetime.now(timezone.utc)
        .replace(microsecond=0)
        .isoformat()
    )

    prediction = "demo_class"
    confidence = 0.92

    logger.info(
        (
            "Prediction completed | request_id=%s | "
            "prediction=%s | confidence=%s | model_release=%s"
        ),
        request_id,
        prediction,
        confidence,
        settings.model_release,
    )

    return PredictResponse(
        prediction=prediction,
        confidence=confidence,
        input=request.text,
        model_release=settings.model_release,
        request_id=request_id,
        timestamp=timestamp,
        environment=settings.environment,
    )