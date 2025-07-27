set -e

echo "=== Starting ita-be-prod FastAPI Application ==="

# Configure Poetry settings
poetry config virtualenvs.in-project false
poetry config virtualenvs.create true

# Install dependencies (Azure should handle this, but ensure it's done)
poetry install --only main --no-root

# Use poetry run with uvicorn directly (keeping it simple)
echo "Starting FastAPI with uvicorn via poetry run..."
exec poetry run uvicorn app.main:app --host 0.0.0.0 --port ${PORT:-8000} --workers 1#!/bin/bash
