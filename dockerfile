FROM node:14 AS node
RUN npm install code-prettify normalize.css

FROM nginx
WORKDIR /usr/share/nginx/html
RUN mkdir -p ./dist/code-prettify/css ./dist/horizn/css ./dist/normalize.css/css ./resources;
COPY --from=node /node_modules/code-prettify/src/prettify.css ./dist/code-prettify/css/
COPY --from=node /node_modules/code-prettify/styles/sunburst.css ./dist/code-prettify/css/
COPY --from=node /node_modules/normalize.css/normalize.css ./dist/normalize.css/css/
COPY ./src/horizn.css ./dist/horizn/css
COPY ./src/template.htm ./index.html
COPY ./resources/ ./resources/
