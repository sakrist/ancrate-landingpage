FROM node:22-alpine AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
ARG PUBLIC_SUPPORT_EMAIL
RUN PUBLIC_SUPPORT_EMAIL="$PUBLIC_SUPPORT_EMAIL" npm run build

FROM nginx:alpine-slim AS runtime
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
