# Use a maintained Node.js image
FROM node:20-bookworm

# Install required system packages
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    ffmpeg \
    imagemagick \
    webp && \
  rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy package files first (for dependency caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project files into the container
COPY . .

# Expose the app port (Heroku sets PORT automatically)
EXPOSE 5000

# Start your bot
CMD ["node", "silva.js"]
