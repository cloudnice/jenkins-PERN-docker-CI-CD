FROM node:14.21.3-alpine3.16
WORKDIR /app
COPY package*.json ./
RUN yarn install
COPY . .
EXPOSE 3000
CMD ["yarn", "run", "start"]