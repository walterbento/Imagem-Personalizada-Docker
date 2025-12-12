#sera construido no momento do bild da imagem a versao especifica: [ docker build -t wal7/docker-node-example:latest . ]
ARG NODE_VERSION=24.11.0
FROM node:${NODE_VERSION}


ENV PORT=3001
ENV MESSAGE="Hello Docker"

#Definir nosso usuario como NAO administrador: [ docker exec -it id_container bash ] e volte a fazer  buiild
#tambem pode comentar a primeir alinha e a sgunda linha coloca um outa porta tipo 3001 ao inves de mynode
RUN useradd -m mynode
USER mynode

WORKDIR /app

COPY . .

# Healthcheck para verificar se o container esta funcionando corretamente
HEALTHCHECK --interval=10s --timeout=5s --start-period=5s --retries=3 \
  CMD ["curl", "-f", "http://localhost:3001/"] || exit 1

CMD ["node", "index.js"]