FROM nginx
EXPOSE 443
EXPOSE 80
COPY dist /usr/share/nginx/html
