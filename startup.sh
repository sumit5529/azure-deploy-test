#!/bin/bash

# startup.sh - Simplified startup script for Azure Web App

echo "Starting FastAPI application..."

# Azure manages the virtual environment automatically
# Just start the application directly
python -m uvicorn app.main:app --host 0.0.0.0 --port ${PORT:-8000} --workers 1