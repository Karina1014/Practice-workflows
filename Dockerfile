# Use the base Nginx image
FROM nginx:latest

# Copy all files from the local "public" directory to the Nginx default HTML directory
COPY public/ /usr/share/nginx/html/

# Expose port 80 to allow HTTP traffic
EXPOSE 80

# Add a healthcheck to verify that the Nginx service is running
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD curl -f http://localhost/ || exit 1