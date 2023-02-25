
FROM node:18.14.1-alpine3.17 AS builder
WORKDIR /app
COPY package.json .
RUN npm install --production
COPY . .
RUN npm run build

FROM nginx:stable-alpine
COPY --from=builder /app/build /usr/share/nginx/html