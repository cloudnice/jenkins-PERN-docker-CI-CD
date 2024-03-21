FROM node:14.21.3-alpine3.16
WORKDIR /usr/src/app
COPY ./server/package*.json ./
RUN npm install
COPY ./server/ .
EXPOSE 5000
CMD ["node","app.js"]
