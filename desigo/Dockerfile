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

# Install system dependencies
RUN apk add --no-cache python3 make g++ git bash netcat-openbsd

# Copy all source files
COPY . .

# Create startup script
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
npx medusa db:migrate\n\
\n\
# Check if .medusa/seeded file exists\n\
if [ ! -f .medusa/seeded ]; then\n\
  echo "Desigo: Seeding database..."\n\
  npx medusa seed --seed-file=\"./src/data/seed.json\"\n\
  mkdir -p .medusa && touch .medusa/seeded\n\
fi\n\
\n\
echo "Desigo: Building project..."\n\
yarn build\n\
\n\
echo "Desigo: Starting Medusa backend..."\n\
yarn dev\n\
' > /app/backend/desigo-startup.sh && chmod +x /app/backend/desigo-startup.sh

# Stage 3: Runner
FROM node:20.8.0-alpine AS runner
WORKDIR /app/backend

# Install netcat and python3
RUN apk add --no-cache python3 netcat-openbsd bash

# Copy from builder stage
COPY --from=builder /app/backend/node_modules ./node_modules
COPY --from=builder /app/backend/package.json ./package.json
COPY --from=builder /app/backend/yarn.lock ./yarn.lock
COPY --from=builder /app/backend/dist ./dist
COPY --from=builder /app/backend/desigo-startup.sh ./desigo-startup.sh
COPY --from=builder /app/backend/medusa-config.js ./medusa-config.js
COPY --from=builder /app/backend/.env* ./

# Install Medusa CLI globally
RUN yarn global add @medusajs/medusa-cli@latest

EXPOSE 9000

ENTRYPOINT ["/bin/sh", "./desigo-startup.sh"]
