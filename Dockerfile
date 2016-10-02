FROM eboraas/apache-php

MAINTAINER michon1992@gmail.com

### Source ###

# Get git
RUN apt-get update
RUN apt-get install -y git

# Get the code
RUN find /var/www/html -mindepth 1 -delete
RUN git clone https://github.com/Orangescrum/orangescrum /var/www/html

# Setup permissions
RUN chmod 0777 -R /var/www/html/app/tmp /var/www/html/app/webroot

# Add the extra files
ADD database.php /var/www/html/app/Config/database.php
ADD start.sh /start.sh

### Apache config ###

# Enable mods
RUN a2enmod rewrite
RUN a2enmod headers

# Enable .htaccess files
RUN sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

### PHP config ###

# Hide errors
RUN sed -i 's/display_errors = .*/display_errors = Off/' /etc/php5/apache2/php.ini

# Change apache php to allow larger uploads/POSTs
RUN sed -i 's/post_max_size = .*/post_max_size = 200M/' /etc/php5/apache2/php.ini
RUN sed -i 's/upload_max_filesize = .*/upload_max_filesize = 200M/' /etc/php5/apache2/php.ini

### Runtime ###

CMD ["/bin/bash", "/start.sh"]
