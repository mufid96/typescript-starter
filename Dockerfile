FROM node:10-alpine

WORKDIR /usr/app
COPY package*.json ./

COPY . .

RUN npm install
# Bundle app source
EXPOSE 3000

CMD npm run start
