.PHONY: help install dev build test lint clean setup deploy-local

help:
	@echo "DesiGo E-commerce Workspace"
	@echo ""
	@echo "Commands:"
	@echo "  make setup       - Initial setup"
	@echo "  make install     - Install all dependencies"
	@echo "  make dev         - Start all services"
	@echo "  make dev:backend - Start backend only"
	@echo "  make dev:frontend - Start frontend only"
	@echo "  make build       - Build all packages"
	@echo "  make test        - Run tests"
	@echo "  make lint        - Lint code"
	@echo "  make clean       - Clean artifacts"
	@echo "  make docker-up   - Start Docker services"
	@echo "  make docker-down - Stop Docker services"
	@echo "  make deploy-local - Deploy to local k8s"

setup:
	@echo "🚀 Setting up DesiGo workspace..."
	npm install
	@echo "✅ Setup complete"

install:
	npm install

dev:
	npm run dev

dev:backend:
	npm run dev:backend

dev:frontend:
	npm run dev:frontend

build:
	npm run build

test:
	npm run test

lint:
	npm run lint

lint:fix:
	npm run lint:fix

type-check:
	npm run type-check

clean:
	npm run clean

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down

deploy-local:
	npm run deploy:local

reset:
	npm run reset

.PHONY: db
db: docker-up
	@echo "✅ Database started at localhost:5432"

.PHONY: format
format:
	npm run lint:fix

.PHONY: check
check: lint type-check test
	@echo "✅ All checks passed"

.PHONY: logs
logs:
	docker-compose logs -f

.PHONY: status
status:
	@echo "📦 Workspace Status:"
	@npm list --depth=0
	@echo ""
	@echo "🐳 Docker Services:"
	@docker-compose ps
