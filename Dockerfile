FROM nginx:latest

COPY index.html /usr/share/nginx/html/
COPY styles.css /usr/share/nginx/html/

# Copiar un archivo de configuración personalizado para Nginx
# Este archivo define ajustes como compresión y seguridad
COPY nginx.conf /etc/nginx/nginx.conf

# Copiar una página de error 404 personalizada
COPY 404.html /usr/share/nginx/html/

# Exponer el puerto 80 para el tráfico HTTP
EXPOSE 80

# Agregar un healthcheck para verificar que el servicio esté en funcionamiento
# Realiza una solicitud a la raíz del servidor y devuelve un error si falla
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD curl -f http://localhost/ || exit 1
