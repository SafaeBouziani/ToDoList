FROM node:lts-alpine3.21

# Install small utilities for healthcheck
RUN apk add --no-cache curl netcat-openbsd

# Create app user early for non-root execution
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
RUN chown appuser:appgroup /app

# Copy package files first to leverage Docker cache
COPY package*.json ./

# Install production dependencies
RUN npm ci --only=production

# Copy app source code and give ownership to appuser
COPY --chown=appuser:appgroup . .

# Environment variables (can be overridden via Docker Compose or Kubernetes)
ENV NODE_ENV=production
ENV PORT=3000

EXPOSE 3000

# Switch to non-root user
USER appuser

# Healthcheck using /healthz endpoint
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:3000/healthz || exit 1

# Start app (app handles DB reconnection)
CMD ["node", "index.js"]
