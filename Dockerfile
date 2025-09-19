# Use a maintained base image
FROM node:20-bookworm

# Install required packages
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    ffmpeg \
    imagemagick \
    webp && \
  rm -rf /var/lib/apt/lists/*

# Copy package.json first for caching
COPY package.json .

# Install dependencies
RUN npm install && npm install qrcode-terminal

# Copy the rest of the project files
COPY . .

# Expose your app port
EXPOSE 5000

# Start the app
CMD ["node", "silva.js"]
