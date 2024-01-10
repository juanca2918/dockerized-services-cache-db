FROM nginx:1.20

RUN apt install python3 python3-dev py3-pip build-base libressl-dev musl-dev libffi-dev rust cargo
RUN pip3 install pip --upgrade
RUN pip3 install certbot-nginx
RUN mkdir /etc/letsencrypt

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80