FROM nginx:latest

# Copiar archivos de la aplicación al contenedor
COPY index.html /usr/share/nginx/html/
COPY styles.css /usr/share/nginx/html/
COPY 404.html /usr/share/nginx/html/

# Copiar el archivo de configuración personalizado de Nginx desde la carpeta 'nginx'
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Exponer el puerto 80 para el tráfico HTTP
EXPOSE 80

# Agregar un healthcheck para verificar el estado de Nginx
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD curl -f http://localhost/ || exit 1
