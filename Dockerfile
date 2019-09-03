FROM nginx

RUN apt-get update

RUN apt-get install -y pandoc

COPY slides.md /usr/share/nginx/html/index.md

RUN pandoc -s -t revealjs --slide-level 3 -o /usr/share/nginx/html/index.html /usr/share/nginx/html/index.md