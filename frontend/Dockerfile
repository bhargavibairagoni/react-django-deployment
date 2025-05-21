FROM node:18

WORKDIR /app

COPY package*.json ./
ENV NODE_OPTIONS=--openssl-legacy-provider
RUN npm install

COPY . .

RUN npm run build

CMD ["npm", "start"]

