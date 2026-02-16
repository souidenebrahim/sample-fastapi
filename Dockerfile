# Use Python 3.12 slim image
FROM python:3.12-slim

# Environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PIP_NO_CACHE_DIR=1

# Install system dependencies (optional but recommended)
# RUN apt-get update && apt-get install -y \
#     build-essential \
#     && rm -rf /var/lib/apt/lists/*

# Install pipenv
RUN pip install pip pipenv

# Set working directory
WORKDIR /app

# Copy Pipenv files first (for Docker layer caching)
COPY Pipfile Pipfile.lock ./

# Install dependencies (system-wide, no virtualenv)
RUN pipenv install --system

# Copy application code
COPY . .

# Expose FastAPI port
EXPOSE 3050

# Start FastAPI with uvicorn
#CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "3050"]
CMD ["python", "-m", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "3050"]
