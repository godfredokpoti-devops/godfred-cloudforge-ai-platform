import os
from dataclasses import dataclass

from dotenv import load_dotenv

load_dotenv()


@dataclass(frozen=True)
class Settings:
    app_name: str
    app_version: str
    environment: str
    log_level: str
    model_name: str
    model_release: str


def load_settings() -> Settings:
    return Settings(
        app_name=os.getenv(
            "APP_NAME",
            "CloudForge Inference Service",
        ),
        app_version=os.getenv(
            "APP_VERSION",
            "1.0.0",
        ),
        environment=os.getenv(
            "ENVIRONMENT",
            "development",
        ),
        log_level=os.getenv(
            "LOG_LEVEL",
            "INFO",
        ).upper(),
        model_name=os.getenv(
            "MODEL_NAME",
            "cloudforge-text-classifier",
        ),
        model_release=os.getenv(
            "MODEL_RELEASE",
            "1.0.0",
        ),
    )


settings = load_settings()