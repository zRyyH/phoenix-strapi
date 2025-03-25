FROM node:22-alpine

# Instala dependências necessárias
RUN apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev vips-dev git python3

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de configuração
COPY package.json package-lock.json* ./

# Instala as dependências
RUN npm ci

# Copia os arquivos do projeto
COPY . .

# Constrói a aplicação
RUN npm run build

# Expõe a porta que o Strapi utiliza
EXPOSE 1337

# Comando para iniciar o Strapi
CMD ["npm", "run", "start"]