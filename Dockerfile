FROM orangescrum/official

MAINTAINER dominik.schlosser@gmail.com

COPY start.sh /
RUN chmod +x start.sh

CMD ["/bin/bash", "/start.sh"]
