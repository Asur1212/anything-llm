# Dockerfile for AnythingLLM
FROM node:18

# Create app directory
WORKDIR /app

# Copy both server and frontend
COPY . .

# Install server dependencies
WORKDIR /app/server
RUN npm install

# Install frontend dependencies and build
WORKDIR /app/frontend
RUN npm install && npm run build

# Move back to server and start it
WORKDIR /app/server
CMD ["npm", "run", "start"]
