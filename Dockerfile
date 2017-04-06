FROM orangescrum/official

MAINTAINER dominik.schlosser@gmail.com

COPY start.sh /
RUN chmod +x start.sh

ENTRYPOINT ["/bin/bash"]
CMD ["/start.sh"]
