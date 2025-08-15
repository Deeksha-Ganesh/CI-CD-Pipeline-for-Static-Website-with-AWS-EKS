FROM nginx:1.29.1-alpine-slim
COPY index.html style.css /usr/share/nginx/html/
