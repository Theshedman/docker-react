FROM node:alpine as builder
RUN apk -U upgrade && apk add yarn
WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html