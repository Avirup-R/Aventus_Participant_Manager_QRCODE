# Use the official Python base image
FROM python:3.9-slim-buster

# Install Python and other dependencies
#RUN apt-get update && \
#    apt-get install -y python3 python3-pip

# Set the working directory in the container
WORKDIR /aventus

# Copy the requirements file to the working directory
#RUN apt update && apt install -y libsm6 libxext6 ffmpeg libfontconfig1 libxrender1 libgl1-mesa-glx zbar-tools

COPY requirements.txt .

# Install the Python dependencies
#RUN apt-get update && \
#    apt-get install -y libgl1-mesa-glx
RUN pip install --no-cache-dir -r requirements.txt


# Copy the application code to the container
COPY . .

# Expose the port on which the FastAPI application will run
EXPOSE 3000
# Start the FastAPI application
#CMD ["flask", "run", "--host", "0.0.0.0", "--port", "3000"]
#CMD ["python", "app.py"]

#CMD ["gunicorn", "main:app", "-w", "4", "-k", "uvicorn.workers.UvicornWorker", "--bind", "farmsense.duckdns.org:443", "--forwarded-allow-ips='*'", "--certfile=secrets/fullchain.pem", "--keyfile=secrets/privkey.pem"]
SHELL ["/bin/bash", "-c"]