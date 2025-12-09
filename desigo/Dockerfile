# Stage 1: Dependencies
FROM node:20.8.0-alpine AS deps
WORKDIR /app/backend

# Copy package files
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile --production=false

# Stage 2: Builder
FROM node:20.8.0-alpine AS builder
WORKDIR /app/backend

# Copy node_modules from deps stage
COPY --from=deps /app/backend/node_modules ./node_modules

# Install system dependencies (python3 for some plugins)
RUN apk add --no-cache python3 make g++ git

# Copy all source files
COPY . .

# Create desigo-startup.sh script
RUN echo '#!/bin/sh\n\
set -e\n\
\n\
echo "Desigo: Waiting for PostgreSQL..."\n\
until nc -z desigo-postgres 5432; do\n\
  sleep 1\n\
done\n\
\n\
echo "Desigo: Waiting for Redis..."\n\
until nc -z desigo-redis 6379; do\n\
  sleep 1\n\
done\n\
\n\
echo "Desigo: Running migrations..."\n\
medusa migrations run\n\
\n\
if [ "$DESIGO_SEED_DB" = "true" ]; then\n\
  echo "Desigo: Seeding database..."\n\
  medusa seed --seed-file="./src/data/seed.json"\n\
fi\n\
\n\
echo "Desigo: Starting Medusa backend..."\n\
medusa start\n\
' > /app/backend/desigo-startup.sh && chmod +x /app/backend/desigo-startup.sh

# Build the application
RUN yarn build

# Stage 3: Runner
FROM node:20.8.0-alpine AS runner
WORKDIR /app/backend

# Install netcat for health checks and python3 for plugins
RUN apk add --no-cache python3 netcat-openbsd

# Copy from builder stage
COPY --from=builder /app/backend/node_modules ./node_modules
COPY --from=builder /app/backend/package.json ./package.json
COPY --from=builder /app/backend/yarn.lock ./yarn.lock
COPY --from=builder /app/backend/dist ./dist
COPY --from=builder /app/backend/desigo-startup.sh ./desigo-startup.sh
COPY --from=builder /app/backend/medusa-config.js ./medusa-config.js

# Install Medusa CLI globally
RUN yarn global add @medusajs/medusa-cli@latest

EXPOSE 9000

ENTRYPOINT ["/bin/sh", "./desigo-startup.sh"]
