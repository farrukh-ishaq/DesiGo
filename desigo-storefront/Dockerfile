FROM node:20-alpine
WORKDIR /app/storefront
RUN corepack enable
COPY package.json yarn.lock .yarnrc.yml ./
COPY .yarn ./.yarn
RUN yarn install --immutable

COPY . .
EXPOSE 8000
CMD ["yarn", "dev"]
