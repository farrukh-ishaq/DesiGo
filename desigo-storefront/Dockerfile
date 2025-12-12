# Stage 1: Base image
FROM node:20-alpine

# Set working directory
WORKDIR /app/storefront

# Disable Next.js telemetry
ENV NEXT_TELEMETRY_DISABLED=1
ENV NODE_ENV=development
ENV PORT=8000

# Enable Corepack for Yarn 4+
RUN corepack enable

# Copy package and yarn files
COPY package.json yarn.lock .yarnrc.yml ./
COPY .yarn ./.yarn

# Install dependencies
RUN yarn install --immutable

# Copy source code
COPY . .

# Optional: Build Next.js (only if you want a production build)
# RUN yarn build

# Expose port
EXPOSE 8000

# Run the development server
CMD ["yarn", "dev"]
