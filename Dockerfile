FROM node:12-alpine

RUN apk add --update bash

# Setting working directory. 
WORKDIR /usr/src/app

# Installing dependencies
COPY package*.json ./
RUN npm install

# Copying source files
COPY . .

# Give permission to run script
RUN chmod +x ./wait-for-it.sh

# Build files
RUN npm run build

# Hardening
#COPY compiler.js /usr/src/app/node_modules/knex/lib/dialects/postgres/query/compiler.js

EXPOSE 3000

# Running the app
CMD [ "npm", "start" ]
