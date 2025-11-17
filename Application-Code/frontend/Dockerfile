# === Build stage ===
FROM node:lts-alpine3.21 AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
ENV NODE_OPTIONS=--openssl-legacy-provider
RUN npm run build

# === Production stage ===
FROM nginxinc/nginx-unprivileged:alpine

# Copy built files
COPY --from=build /app/build /usr/share/nginx/html

# Copy nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]
