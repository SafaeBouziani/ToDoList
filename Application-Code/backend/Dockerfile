FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install && npm cache clean --force

COPY . .

ENV NODE_ENV=production
ENV PORT=3000

EXPOSE 3000

# Ajouter un utilisateur non-root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Healthcheck
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget -q --spider http://localhost:3000/ || exit 1

# Attendre MongoDB avant de démarrer l'app
CMD sh -c 'until nc -z mongo 27017; do echo "Waiting for MongoDB..."; sleep 2; done; node index.js'