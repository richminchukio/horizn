FROM node:14 AS node
RUN npm install code-prettify normalize.css

FROM nginx
RUN mkdir -p /usr/share/nginx/html/dist/code-prettify/css /usr/share/nginx/html/dist/horizn/css /usr/share/nginx/html/dist/normalize.css/css /usr/share/nginx/html/resources;
COPY --from=node /node_modules/code-prettify/src/prettify.css /usr/share/nginx/html/dist/code-prettify/css/
COPY --from=node /node_modules/code-prettify/styles/sunburst.css /usr/share/nginx/html/dist/code-prettify/css/
COPY --from=node /node_modules/normalize.css/normalize.css /usr/share/nginx/html/dist/normalize.css/css/
COPY ./src/horizn.css /usr/share/nginx/html/dist/horizn/css
COPY ./src/template.htm /usr/share/nginx/html/index.html
COPY ./resources/ /usr/share/nginx/html/resources/
