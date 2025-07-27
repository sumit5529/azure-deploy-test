#!/bin/bash

# startup.sh - Production startup script for Azure Web App

echo "Starting FastAPI application..."

# Activate virtual environment (Poetry creates .venv in project)
source .venv/bin/activate

# Set environment variables (these will be overridden by Azure App Settings)
export PYTHONPATH="${PYTHONPATH}:/home/site/wwwroot"

# Start the FastAPI application with uvicorn
# --host 0.0.0.0: Accept connections from any IP
# --port $PORT: Use Azure's assigned port (fallback to 8000)
# --workers 4: Use multiple workers for better performance
exec uvicorn app.main:app \
    --host 0.0.0.0 \
    --port ${PORT:-8000} \
    --workers 4 \
    --access-log \
    --error-log