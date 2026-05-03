FROM busybox:1.36

WORKDIR /www

COPY index.template.html /www/index.template.html
COPY start.sh /usr/local/bin/start.sh

RUN chmod +x /usr/local/bin/start.sh

EXPOSE 8080

CMD ["/usr/local/bin/start.sh"]
