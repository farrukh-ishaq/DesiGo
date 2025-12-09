#!/bin/bash

echo "Starting Desigo E-commerce Platform..."

# Build and start containers
docker-compose up --build -d

echo ""
echo "Desigo Services:"
echo "────────────────"
echo "Backend API:    http://localhost:9000"
echo "Storefront:     http://localhost:8000"
echo "PostgreSQL:     localhost:5432 (desigo/desigo123)"
echo "Redis:          localhost:6379"
echo ""

echo "To seed the database:"
echo "  docker-compose exec backend medusa seed --seed-file=\"./src/data/seed.json\""
echo ""
echo "To view logs:"
echo "  docker-compose logs -f backend"
echo ""
echo "To stop:"
echo "  docker-compose down"
