.PHONY: help setup install dev dev-backend dev-frontend build build-backend build-frontend docker-dev docker-up docker-down logs clean reset

# ---------- HELP ----------
help:
	@echo "🚀 DesiGo E-commerce Workspace (Yarn v1)"
	@echo ""
	@echo "📦 Development:"
	@echo "  make setup               - Initial workspace setup"
	@echo "  make install             - Install dependencies"
	@echo "  make dev                 - Start backend + frontend"
	@echo "  make dev-backend         - Start backend only"
	@echo "  make dev-frontend        - Start frontend only"
	@echo ""
	@echo "🐳 Docker Commands:"
	@echo "  make docker-up           - Start Postgres & Redis"
	@echo "  make docker-dev          - Start backend + frontend in Docker"
	@echo "  make docker-down         - Stop Docker services"
	@echo "  make logs                - View Docker logs"
	@echo ""
	@echo "🧹 Cleanup:"
	@echo "  make clean               - Remove build artifacts"
	@echo "  make reset               - Delete node_modules and reinstall"

# ---------- DEVELOPMENT ----------
setup install:
	@echo "🚀 Setting up workspace using Yarn..."
	yarn install
	@echo "✅ Setup complete!"

dev:
	@echo "🚀 Starting backend + frontend..."
	concurrently "yarn workspace @desigo/backend dev" "yarn workspace @desigo/frontend dev"

dev-backend:
	yarn workspace @desigo/backend dev

dev-frontend:
	yarn workspace @desigo/frontend dev

build: build-backend build-frontend

build-backend:
	yarn workspace @desigo/backend build

build-frontend:
	yarn workspace @desigo/frontend build

# ---------- DOCKER ----------
docker-up:
	@echo "🐳 Starting database services..."
	docker-compose up -d postgres redis
	@sleep 3
	@echo "✅ Postgres & Redis ready!"

docker-dev: docker-up
	@echo "🚀 Starting backend + frontend in Docker..."
	docker-compose up backend frontend

docker-down:
	@echo "🛑 Stopping Docker..."
	docker-compose down

logs:
	@echo "📋 Docker logs (CTRL+C to exit)..."
	docker-compose logs -f

# ---------- CLEANUP ----------
clean:
	@echo "🧹 Cleaning build artifacts..."
	rm -rf src/backend/dist
	rm -rf src/frontend/.next
	rm -rf src/frontend/out

reset:
	@echo "🧹 Removing node_modules..."
	rm -rf node_modules
	rm -rf src/backend/node_modules
	rm -rf src/frontend/node_modules
	@echo "📦 Reinstalling dependencies..."
	yarn install
	@echo "✅ Reset complete!"
