ARG NODE_VERSION=20.12.1
 
FROM node:${NODE_VERSION}-alpine as build-env
 
WORKDIR /usr/src/app
COPY package*.json ./
 
RUN yarn install
COPY . .
RUN yarn build


#build using node
FROM node:${NODE_VERSION}-alpine
WORKDIR /usr/src/app
COPY --from=build-env /usr/src/app ./
EXPOSE 3000
CMD ["./build/index.js"]

# FROM nginx:1.21.1-alpine
# COPY --from=build-env /usr/src/app/build /usr/share/nginx/html
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]

# FROM keymetrics/pm2:latest-alpine
# WORKDIR /app
# COPY --from=build-env /usr/src/app/build /app/
# EXPOSE 3000
# CMD [ "pm2-runtime", "start","./index.js" ]