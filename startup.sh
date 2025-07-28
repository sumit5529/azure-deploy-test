#!/bin/bash
set -e

# Export PATH to include Poetry if installed via ~/.local/bin
export PATH="$HOME/.local/bin:$PATH"

# Define poetry virtualenv path (adjust as needed)
VENV_PATH="$HOME/antenv"

# Install poetry if not present
if ! command -v poetry &> /dev/null; then
    echo "Installing Poetry..."
    curl -sSL https://install.python-poetry.org | python3 -
    export PATH="$HOME/.local/bin:$PATH"
fi

# Configure Poetry
poetry config virtualenvs.create true
poetry config virtualenvs.in-project false
poetry install --no-root

# Create venv if missing (optional)
if [ ! -d "$VENV_PATH" ]; then
    echo "Creating poetry virtual environment..."
    poetry env use python3
    poetry run pip install uvicorn
fi

# Start the FastAPI app
echo "Starting Uvicorn server..."
poetry run uvicorn app.main:app --host 0.0.0.0 --port 8000


