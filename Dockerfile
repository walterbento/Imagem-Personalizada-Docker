#sera construido no momento do bild da imagem a versao especifica: [ docker build -t wal7/docker-node-example:latest . ]
ARG NODE_VERSION=24.11.0
FROM node:${NODE_VERSION}

WORKDIR /app

COPY . .

CMD ["node", "index.js"]