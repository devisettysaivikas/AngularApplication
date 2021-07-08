FROM node:16-alpine3.11 as builder
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build --prod

FROM nginx:1.17.1-alpine
COPY --from=builder /usr/src/app/dist/pevs311dockersample/ /usr/share/nginx/html