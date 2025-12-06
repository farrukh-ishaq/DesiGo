# ------------------------------
# 1) Build Stage
# ------------------------------
FROM node:18-alpine AS builder

WORKDIR /workspace

# Copy workspace manifests
COPY package.json yarn.lock ./
COPY packages ./packages
COPY src/backend/package.json ./src/backend/

# Install monorepo deps (cached)
RUN yarn install --frozen-lockfile

# Copy backend source
COPY src/backend ./src/backend

# Build backend
RUN yarn workspace @desigo/backend build

# ------------------------------
# 2) Production Stage
# ------------------------------
FROM node:18-alpine AS production

WORKDIR /app

# Copy built backend
COPY --from=builder /workspace/src/backend/dist ./dist

# Copy only backend manifests
COPY src/backend/package.json ./

# Install only backend production dependencies
RUN yarn install --frozen-lockfile --production

# Add user
RUN addgroup -S nodejs && adduser -S desigo -G nodejs
USER desigo

EXPOSE 9000

CMD ["node", "dist/main.js"]
