FROM node:23-alpine

WORKDIR /app/fistExpress

COPY package.json ./
COPY src ./src
RUN npm install
EXPOSE 3000

CMD [ "npm","start"]