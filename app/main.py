from fastapi import FastAPI
from fastapi.responses import HTMLResponse

app = FastAPI()

# --------------------
# Health endpoint
# --------------------
@app.get("/", response_class=HTMLResponse)
async def health():
    return """
    <!DOCTYPE html>
    <html>
        <head>
            <title>Home</title>
        </head>
        <body>
            <h1>Hello World!</h1>
            <p>Your API is running successfully 🚀</p>
        </body>
    </html>
    """
