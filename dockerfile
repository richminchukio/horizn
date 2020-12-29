FROM node:14-alpine AS node
ARG HORIZN_VERSION=beta
RUN npm --loglevel=error install code-prettify normalize.css horizn@${HORIZN_VERSION}

FROM nginx:stable-alpine
WORKDIR /usr/share/nginx/html
RUN mkdir -p ./dist/code-prettify/css ./dist/horizn/css ./dist/normalize.css/css ./resources;
COPY --from=node /node_modules/code-prettify/src/prettify.css ./dist/code-prettify/css/
COPY --from=node /node_modules/code-prettify/styles/sunburst.css ./dist/code-prettify/css/
COPY --from=node /node_modules/horizn/src/horizn.css ./dist/horizn/css/
COPY --from=node /node_modules/normalize.css/normalize.css ./dist/normalize.css/css/
COPY --from=node /node_modules/horizn/src/template.htm ./index.html
COPY --from=node /node_modules/horizn/resources/ ./resources/
