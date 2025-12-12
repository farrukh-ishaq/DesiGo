#!/bin/bash
set -e

# Step 1: Clean old containers & volumes (optional, only dev)
echo "Cleaning old containers and volumes..."
docker-compose down -v --remove-orphans

# Step 2: Build backend & frontend images
echo "Building Docker images..."
docker-compose build

# Step 3: Start Postgres & Redis first
echo "Starting database & Redis..."
docker-compose up -d postgres redis

# Wait for Postgres to be ready
echo "Waiting for Postgres to be healthy..."
until docker exec desigo-postgres pg_isready -U desigo; do
  sleep 1
done

# Step 4: Start backend (runs migrations, seeds, and starts Medusa)
echo "Starting backend..."
docker-compose up -d backend

# Wait until backend is healthy (using healthcheck from docker-compose)
echo "Waiting for backend to be healthy..."
until [ "$(docker inspect -f {{.State.Health.Status}} desigo-backend)" == "healthy" ]; do
  sleep 1
done

# Step 5: Start storefront
echo "Starting storefront..."
docker-compose up -d storefront

# Step 6: Show logs (optional)
echo "All services started. Showing logs..."
docker-compose logs -f
