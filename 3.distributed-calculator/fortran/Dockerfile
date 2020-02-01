#FROM centos:latest
#RUN yum update -y
#RUN yum install -y gcc-gfortran gdb make

#COPY . /app
#WORKDIR /app
#RUN make

#CMD ["./server"]

FROM ubuntu:latest

# Install software
RUN apt-get update
RUN apt-get install -y gfortran gdb make nginx libfcgi-dev spawn-fcgi

# Place nginx configuration file
RUN rm -v /etc/nginx/sites-available/default
ADD default /etc/nginx/sites-available/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Fortran Controller
COPY . /app
WORKDIR /app
RUN make

# Configuration
EXPOSE 80

CMD bash start.sh