from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "Azure"}

@app.get("/health")
def health_check():
    return {"status": "healthy"}