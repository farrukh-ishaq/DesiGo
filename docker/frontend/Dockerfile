# ------------------------------
# 1) Build Stage
# ------------------------------
FROM node:18-alpine AS builder

WORKDIR /workspace

# Copy monorepo manifests
COPY package.json yarn.lock ./

# Copy workspace packages (shared configs, utils, etc.)
COPY packages ./packages

# Copy frontend package manifest
COPY src/frontend/package.json ./src/frontend/

# Install deps for ALL workspaces (cached)
RUN yarn install --frozen-lockfile

# Copy frontend source
COPY src/frontend ./src/frontend

# Build Next.js standalone
RUN yarn workspace @desigo/frontend build

# ------------------------------
# 2) Production Runtime Stage
# ------------------------------
FROM node:18-alpine AS runner

WORKDIR /app
ENV NODE_ENV=production

# Copy Next.js standalone server
COPY --from=builder /workspace/src/frontend/.next/standalone ./

# Copy static assets
COPY --from=builder /workspace/src/frontend/public ./public
COPY --from=builder /workspace/src/frontend/.next/static ./.next/static

# Non-root user
RUN addgroup -S nodejs -g 1001 && \
    adduser -S desigo -u 1001 -G nodejs

USER desigo

EXPOSE 3000

CMD ["node", "server.js"]
