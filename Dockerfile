#sera construido no momento do bild da imagem a versao especifica: [ docker build -t wal7/docker-node-example:latest . ]
ARG NODE_VERSION=24.11.0
FROM node:${NODE_VERSION}

#Definir nosso usuario como NAO administrador: [ docker exec -it id_container bash ] e volte a fazer  buiild
#tambem pode comentar a primeir alinha e a sgunda linha coloca um outa porta tipo 3001 ao inves de mynode
RUN useradd -m mynode
USER mynode

WORKDIR /app

COPY . .

CMD ["node", "index.js"]