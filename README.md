# DesiGo
This repository contains a production-ready, full-stack e-commerce platform engineered with a modern, cloud-native architecture. It uses Medusa as the headless commerce engine and integrates tightly with Stripe for secure and reliable payment processing.

# Architecture Overview
![architectureDiagram.png](architectureDiagram.png)

# Technical Stack
````
🔧 Technology Stack
Backend: Medusa.js (Node.js, TypeScript, PostgreSQL, Redis)

Frontend: Next.js 14, React 18, TypeScript, Tailwind CSS

Database: PostgreSQL 15, Redis 7

Containerization: Docker, Docker Compose

Orchestration: Kubernetes, Helm

Infrastructure: Terraform

Monitoring: Prometheus, Grafana

CI/CD: GitHub Actions
````

##  📦Workspace Packages
@desigo/shared - Shared types and utilities

@desigo/backend - Medusa backend service

@desigo/frontend - Next.js frontend

@desigo/scripts - Deployment and utility scripts

🌐 Environment Variables
Copy .env.example to .env and configure:
````
# Backend
DATABASE_URL=postgresql://desigo:desigo123@localhost:5432/desigo
REDIS_URL=redis://localhost:6379
JWT_SECRET=your-secret-key
COOKIE_SECRET=your-cookie-secret

# Frontend
NEXT_PUBLIC_BACKEND_URL=http://localhost:9000
````

## 🚀 Quick Start

```bash
# 1. Clone repository
git clone <repository-url>
cd desigo

# 2. Setup workspace
make setup

# 3. Start services
make docker-up
make dev

# 4. Access applications
# Storefront: http://localhost:3000
# Backend API: http://localhost:9000
# Admin Panel: http://localhost:9000/admin

```

````
# Makefile Commands
# Development
make dev              # Start all services
make dev:backend      # Start backend only
make dev:frontend     # Start frontend only

# Database
make docker-up        # Start database services
make docker-down      # Stop database services
make db:migrate       # Run database migrations
make db:seed          # Seed database

# Build & Test
make build            # Build all packages
make test             # Run tests
make lint             # Lint code
make type-check       # Type checking

# Deployment
make deploy-local     # Deploy to local Kubernetes
make status           # Check workspace status
make logs             # View service logs

````

## URL: Your store will be available at:

```shell
make docker-up    # Start databases
make dev          # Start backend and frontend
```

Storefront: http://localhost:3000

Backend API: http://localhost:9000

Admin Panel: http://localhost:9000/admin

Database: localhost:5432 (user: desigo, pass: desigo123)
