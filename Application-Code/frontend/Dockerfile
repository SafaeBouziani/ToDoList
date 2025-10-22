
# Build stage
FROM node:18-alpine AS build

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy source code
COPY . .

# Set NODE_OPTIONS pour supporter les anciens algorithmes OpenSSL
ENV NODE_OPTIONS=--openssl-legacy-provider

# Build the application
RUN npm run build

# Production stage - Using nginxinc/nginx-unprivileged
FROM nginxinc/nginx-unprivileged:alpine

# Copy built assets from build stage
COPY --from=build /app/build /usr/share/nginx/html

# Copy custom nginx config (optional)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose non-privileged port
EXPOSE 3000

# Health check - Utiliser curl au lieu de wget
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD ["/bin/sh", "-c", "nc -z localhost 8080 || exit 1"]

# User already set to nginx (UID 101) in base image
CMD ["nginx", "-g", "daemon off;"]