FROM node

WORKDIR /app

COPY package.json ./

COPY .env.* ./

RUN npm install

COPY . .

EXPOSE 8000

CMD [ "npm","run","start" ]

