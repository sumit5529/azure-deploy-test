

# Enable error handling
set -e


# Update and install necessary packages
apt-get update && apt-get install sudo
sudo apt-get install -y poppler-data poppler-utils tesseract-ocr libgl1-mesa-dev libglib2.0-0 libmagic1 libmagic-dev

# Install Poetry 1.8.3 if not available
if ! command -v poetry &> /dev/null; then
    echo "Installing Poetry 1.8.3..."
    curl -sSL https://install.python-poetry.org | POETRY_VERSION=1.8.3 python3 -
    export PATH="/root/.local/bin:$PATH"
fi

poetry config virtualenvs.in-project false
poetry config virtualenvs.create true

poetry install

# Check if .venv exists, if not create it explicitly
if [ ! -d ".venv" ]; then
    poetry env use python3
fi

# Use poetry run instead of manual activation
poetry run uvicorn app.main:app --host 0.0.0.0 --port ${PORT:-8000}
