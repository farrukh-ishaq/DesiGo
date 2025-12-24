FROM node:20.8.0-alpine

WORKDIR /app/backend

# System deps
RUN apk add --no-cache python3 make g++ git bash netcat-openbsd

# Copy package files
COPY package.json yarn.lock ./

# Install deps
RUN yarn install --legacy-peer-deps

# Copy backend source
COPY . .

# Startup script
RUN cat << 'EOF' > /usr/local/bin/desigo-startup.sh
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
echo "Deisigo dependencies installed"
yarn install

echo "Desigo: Building"
yarn build

echo "Desigo: Starting Medusa backend..."
yarn dev
EOF

RUN chmod +x /usr/local/bin/desigo-startup.sh

# 🔥 THIS FIXES YOUR ERROR
HEALTHCHECK --interval=10s --timeout=3s --start-period=30s --retries=5 \
  CMD nc -z localhost 9000 || exit 1

EXPOSE 9000
ENTRYPOINT ["/bin/sh", "/usr/local/bin/desigo-startup.sh"]
