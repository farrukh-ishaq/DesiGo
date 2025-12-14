# Stage 1: Dependencies
FROM node:20.8.0-alpine AS deps
WORKDIR /app/backend

# Copy package files
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --legacy-peer-deps

# Stage 2: Builder
FROM node:20.8.0-alpine AS builder
WORKDIR /app/backend

# Copy node_modules
COPY --from=deps /app/backend/node_modules ./node_modules

# Install system dependencies
RUN apk add --no-cache python3 make g++ git bash netcat-openbsd

# Copy all backend files
COPY . .

# Startup script
RUN cat << 'EOF' > /app/backend/desigo-startup.sh
#!/bin/sh
set -e

echo "Desigo: Waiting for PostgreSQL..."
until nc -z desigo-postgres 5432; do sleep 1; done

echo "Desigo: Waiting for Redis..."
until nc -z desigo-redis 6379; do sleep 1; done

echo "Desigo: Running migrations..."
npx medusa db:migrate

if [ ! -f .medusa/seeded ]; then
  echo "Desigo: Seeding database..."
  yarn seed
  mkdir -p .medusa && touch .medusa/seeded
  echo "Desigo: Creating admin user..."
  npx medusa user -e admin@desigo.com -p supersecret
fi

echo "Desigo: Building project..."
yarn build

echo "Desigo: Starting Medusa backend..."
yarn dev
EOF

RUN chmod +x /app/backend/desigo-startup.sh

# Stage 3: Runner
FROM node:20.8.0-alpine AS runner
WORKDIR /app/backend

RUN apk add --no-cache python3 netcat-openbsd bash

# Copy built backend from builder
COPY --from=builder /app/backend/node_modules ./node_modules
COPY --from=builder /app/backend/package.json ./package.json
COPY --from=builder /app/backend/yarn.lock ./yarn.lock
COPY --from=builder /app/backend/src ./src
COPY --from=builder /app/backend/tsconfig.json ./tsconfig.json
COPY --from=builder /app/backend/.medusa ./.medusa
COPY --from=builder /app/backend/desigo-startup.sh ./desigo-startup.sh
COPY --from=builder /app/backend/medusa-config.js ./medusa-config.js
COPY --from=builder /app/backend/.env* ./

# Install Medusa CLI globally
RUN yarn global add @medusajs/medusa-cli@latest

EXPOSE 9000
ENTRYPOINT ["/bin/sh", "./desigo-startup.sh"]
