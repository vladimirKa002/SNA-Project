FROM nginx:1.14-alpine
RUN rm -r /etc/nginx/conf.d
COPY ./config /etc/nginx/conf.d
COPY ./static /app/static