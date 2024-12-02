# Imagen base de Nginx
FROM nginx:latest

# Copiar el archivo de configuración personalizado
COPY config/nginx.conf /etc/nginx/nginx.conf

# Copiar los archivos de la aplicación web
COPY html/index.html /usr/share/nginx/html/
COPY html/styles.css /usr/share/nginx/html/
COPY html/404.html /usr/share/nginx/html/

# Exponer el puerto 80 para el tráfico HTTP
EXPOSE 80

# Healthcheck para verificar que el servicio está activo
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD curl -f http://localhost/ || exit 1
