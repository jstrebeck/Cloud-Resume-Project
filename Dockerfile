FROM nginx:latest

LABEL maintainer="Joshua Strebeck"

COPY ./contactform/ /usr/share/nginx/html/contactform/
COPY ./js/ /usr/share/nginx/html/js/
COPY ./img/ /usr/share/nginx/html/img/
COPY ./scripts/ /usr/share/nginx/html/scripts/
COPY ./css/ /usr/share/nginx/html/css/
COPY ./lib/ /usr/share/nginx/html/lib/
COPY ./index.html /usr/share/nginx/html/index.html