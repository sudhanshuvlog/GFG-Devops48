FROM amazonlinux
RUN yum install -y httpd python3 vim procps-ng
LABEL maintainer=gfg
LABEL env=prod
WORKDIR /var/www/html
COPY index.html .
ENV dbhost=gfg.com
EXPOSE 80
#CMD ["date"]
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]