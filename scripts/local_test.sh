#!/usr/bin/env bash
set -euo pipefail

cd services/platform-api
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
uvicorn app.main:app --reload
