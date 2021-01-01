ARG LOCAL=0

FROM node:14-alpine AS node
ARG HORIZN_VERSION=beta
RUN npm --loglevel=error install normalize.css horizn@${HORIZN_VERSION}

FROM nginx:stable-alpine AS LOCAL0
WORKDIR /usr/share/nginx/html
RUN mkdir -p ./dist/horizn/css ./dist/normalize.css/css ./resources;
RUN mkdir -p ./slim/dist/horizn/css ./slim/dist/normalize.css/css ./slim/resources;
COPY --from=node /node_modules/normalize.css/normalize.css ./dist/normalize.css/css/
RUN cp -r ./dist/ ./slim/
COPY --from=node /node_modules/horizn/dist/css/ ./dist/horizn/css/
COPY --from=node /node_modules/horizn/dist/css/ ./slim/dist/horizn/css/
COPY --from=node /node_modules/horizn/src/template.htm ./index.html
COPY --from=node /node_modules/horizn/src/template-slim.htm ./slim/index.html
COPY --from=node /node_modules/horizn/resources/ ./resources/
COPY --from=node /node_modules/horizn/resources/ ./slim/resources/

FROM nginx:stable-alpine AS LOCAL1
WORKDIR /usr/share/nginx/html
RUN mkdir -p ./dist/horizn/css ./dist/normalize.css/css ./resources;
RUN mkdir -p ./slim/dist/horizn/css ./slim/dist/normalize.css/css ./slim/resources;
COPY --from=node /node_modules/normalize.css/normalize.css ./dist/normalize.css/css/
COPY ./dist/css/ ./dist/horizn/css/
COPY ./dist/css/ ./slim/dist/horizn/css/
COPY ./src/template.htm ./index.html
COPY ./src/template-slim.htm ./slim/index.html
COPY ./resources/ ./resources/
COPY ./resources/ ./slim/resources/

FROM LOCAL${LOCAL} AS final
RUN echo ${LOCAL}