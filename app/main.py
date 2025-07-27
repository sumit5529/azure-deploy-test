from fastapi import FastAPI, HTTPException
import os
from dotenv import load_dotenv

load_dotenv()  # Loads .env file locally, does nothing in Azure

DATABASE_URL = os.getenv('DATABASE_URL')
SECRET_KEY = os.getenv('SECRET_KEY')
DEBUG = os.getenv('DEBUG', 'False').lower() == 'true'

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "Azure"}

@app.get("/health")
def health_check():
    return {"status": "healthy"}

def get_env_vars():
    """A fun function that returns environment variables in a creative way"""
    return {
        "🔗 Database URL": DATABASE_URL or "Not set! 🤷‍♂️",
        "🔐 Secret Key": SECRET_KEY or "Missing! 😱",
        "🐛 Debug Mode": "ON! 🎉" if DEBUG else "OFF! 😴",
        "💡 Fun Fact": "Environment variables are like secrets in a treasure chest! 🏴‍☠️",
        "🎯 Status": "All good! ✨" if all([DATABASE_URL, SECRET_KEY]) else "Some vars missing! ⚠️"
    }

@app.get("/env-vars")
def show_env_vars():
    """Endpoint that shows environment variables in a fun way"""
    return get_env_vars()

def crazy_function():
    """A fun function that raises a custom error"""
    raise ValueError("🎉 Oops! Something went crazy! This is a fun error! 🎉")

@app.get("/crazy")
def trigger_crazy_function():
    """Endpoint that triggers the crazy function and raises an error"""
    try:
        crazy_function()
    except ValueError as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/direct-error")
def direct_error():
    """Directly raise an error without try-catch"""
    crazy_function()
    return {"message": "This will never be reached!"}