from fastapi import FastAPI

app = FastAPI()

# --------------------
# Health endpoint
# --------------------
@app.get("/")
async def health():
    return {"message": "Hello World!"}
