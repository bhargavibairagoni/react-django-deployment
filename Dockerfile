FROM python:3.9-slim
# Install Node.js and required utilities
RUN apt-get update && apt-get install -y curl gnupg build-essential \
    && curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean
# Install Supervisor to run both frontend and backend
RUN apt-get install -y supervisor
# Create app directories
WORKDIR /app
# Copy and install Python dependencies
COPY backend/requirements.txt /app/backend/
RUN pip install --upgrade pip && pip install -r /app/backend/requirements.txt
# Copy backend code
COPY backend/ /app/backend/
# Copy frontend files and install dependencies
COPY frontend/package*.json /app/frontend/
WORKDIR /app/frontend
RUN npm install
COPY frontend/ /app/frontend/
RUN npm run build
# Create Supervisor config
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose both ports
EXPOSE 8000 3000

# Start both services
CMD ["/usr/bin/supervisord"]
