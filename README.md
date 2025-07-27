cat > README.md << 'EOF'
# Azure Deploy

A FastAPI application for Azure deployment.

## Installation

```bash
poetry install
```

## Running the app

```bash
poetry run uvicorn app.main:app --reload
```

## Endpoints

- `/` - Main page
- `/health` - Health check  
- `/env-vars` - Environment variables
- `/crazy` - Fun error endpoint
- `/docs` - API documentation

## Environment Variables

Create a `.env` file with: