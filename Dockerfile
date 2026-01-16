FROM node:20-bullseye

# Install system dependencies (git, ffmpeg, curl, etc.)
RUN apt-get update && \
    apt-get install -y \
    git \
    ffmpeg \
    curl \
    imagemagick \
    webp \
    && rm -rf /var/lib/apt/lists/*

# Install PM2 globally
RUN npm install -g pm2

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install project dependencies
# Using --legacy-peer-deps to avoid potential conflicts as seen in user logs/context
RUN npm install --legacy-peer-deps

# Copy the rest of the application code
COPY . .

# Expose the port
EXPOSE 5000

# Start the application using PM2
CMD ["pm2-runtime", "start", "index.js", "--name", "mega-md", "--output", "/dev/stdout", "--error", "/dev/stderr"]
