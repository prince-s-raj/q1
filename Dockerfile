FROM ubuntu
MAINTAINER raat
RUN apt-get update
RUN apt-get -y install nginx
ADD . /var/www/html/
COPY . /var/www/html/
ENTRYPOINT ["usr/sbin/nginx","-g","daemon off;"]
EXPOSE 80

FROM ubuntu 
MAINTAINER raat
RUN apt-get update
RUN apt-get -y install httpd
ADD . /var/www/html
COPY ./var/www/html
CMD ["usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80

FROM python
WORKDIR /app
COPY hello.py ./
CMD ["python","hello.py"]

