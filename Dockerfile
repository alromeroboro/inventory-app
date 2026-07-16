# Use a slim Python image to keep the container size small
FROM python:3.11-slim

# Prevent Python from writing .pyc files and enable unbuffered logging
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose port 8080 for Cloud Run or other environments
EXPOSE 8080

# Run the application using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]