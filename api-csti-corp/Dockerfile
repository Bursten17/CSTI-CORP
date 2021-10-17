FROM node:12 as dev

# ENV NODE_ENV=production

WORKDIR /usr/src/app/

COPY package.json .

RUN npm install
RUN npm install -g nodemon

COPY . .

EXPOSE 4000

ENTRYPOINT ["nodemon","-L","--inspect=0.0.0.0", "server.js"]
# CMD ["node","--inspect=0.0.0.0", "server.js"]
