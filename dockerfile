ARG LOCAL=0

FROM node:14-alpine AS base
ARG HORIZN_VERSION=beta
WORKDIR /
RUN npx express-generator app --view pug
WORKDIR /app
RUN npm --loglevel=error install normalize.css horizn@${HORIZN_VERSION}
RUN npm install
RUN sed s/public/public\'\)\)\)\;\\napp.use\(express.static\(path.join\(__dirname,\ \'node_modules\\/horizn\\/resources/ -i app.js app.js
RUN sed s/public/public\'\)\)\)\;\\napp.use\(express.static\(path.join\(__dirname,\ \'node_modules\\/horizn\\/dist\\/css/ -i app.js app.js
RUN sed s/public/public\'\)\)\)\;\\napp.use\(express.static\(path.join\(__dirname,\ \'node_modules\\/normalize.css/ -i app.js app.js

FROM base AS LOCAL0
ARG SLIM=
WORKDIR /app
RUN cp ./node_modules/horizn/src/index.pug ./views
RUN cp ./node_modules/horizn/src/layout${SLIM}.pug ./views/layout.pug

FROM base AS LOCAL1
ARG SLIM=
WORKDIR /app/node_modules/horizn
RUN mkdir -p ./dist/css ./resources;
COPY ./dist/css/ ./dist/css/
COPY ./resources/ ./resources/
WORKDIR /app/
COPY ./src/index.pug ./views
COPY ./src/layout${SLIM}.pug ./views/layout.pug

FROM LOCAL${LOCAL} AS final
EXPOSE 3000
WORKDIR /app
USER node
ENTRYPOINT ["node", "./bin/www"]