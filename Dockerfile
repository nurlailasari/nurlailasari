# -- Build Dep
FROM node:dubnium-alpine as build-dep

WORKDIR /app
COPY package*.json .
RUN npm install

# -- Copy Node & Dep and Run App
FROM node:10-alpine
WORKDIR /app
COPY --from=build-dep /app .
COPY . .
ENTRYPOINT ["node", "server/server.js"]
