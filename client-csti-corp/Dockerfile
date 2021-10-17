FROM node:12 as node

ENV VUE_APP_BASE_URL = localhost

WORKDIR /app
COPY ./ /app
RUN npm rebuild node-sass
RUN npm install
RUN npm run build

FROM nginx
COPY --from=node /app/dist/ /usr/share/nginx/html
