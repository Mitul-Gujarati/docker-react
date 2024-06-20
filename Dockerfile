FROM node:16-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

## it will use above entire code it will create image with below code and create image with ngix
## if we access nginx it will automatic route to react code. 
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html