#stage 1
FROM node:14-alpine as node
WORKDIR /app
COPY . .
RUN npm install npm@6.14.13
RUN rm -rf /usr/local/lib/node_modules/npm
RUN mv node_modules/npm /usr/local/lib/node_modules/npm
RUN npm run build --prod

#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/pevs311dockersample /usr/share/nginx/html
