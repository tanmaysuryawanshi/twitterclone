ARG NODE_VERSION=20.12.1
 
FROM node:${NODE_VERSION}-alpine as build-env
 
WORKDIR /usr/src/app
COPY package*.json ./
 
RUN yarn install
COPY . .
RUN yarn build
FROM node:${NODE_VERSION}-alpine
#FROM gcr.io/distroless/nodejs20-debian12
#FROM gcr.io/distroless/nodejs
WORKDIR /usr/src/app
COPY --from=build-env /usr/src/app ./
EXPOSE 3000
CMD ["./build/index.js"]