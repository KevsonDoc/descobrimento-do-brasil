# Etapa de produção com Nginx
FROM nginx:alpine AS production

# Ensure all packages are up-to-date to reduce vulnerabilities
RUN apk update && apk upgrade --no-cache

# Copia os arquivos estáticos para o diretório padrão do Nginx
COPY /src /usr/share/nginx/html

# Copia um arquivo de configuração customizado do Nginx, se necessário
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
