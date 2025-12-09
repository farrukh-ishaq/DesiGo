# Simplified dev Dockerfile
FROM node:20.8.0-alpine

WORKDIR /app/storefront

# Enable Corepack for Yarn 4
RUN corepack enable

# Copy Yarn configuration files
COPY package.json yarn.lock .yarnrc.yml ./
COPY .yarn ./.yarn

# Install dependencies
RUN yarn install --immutable

# Copy source code
COPY . .

EXPOSE 8000

# Use yarn dev for development
CMD ["yarn", "start"]
