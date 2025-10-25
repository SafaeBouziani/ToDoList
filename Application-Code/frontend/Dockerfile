
# Build stage
FROM node:lts-alpine3.21 AS build

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

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

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
