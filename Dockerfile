FROM php:5.6-apache

COPY php.ini-production "$PHP_INI_DIR/php.ini"
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY start-apache /usr/local/bin
RUN a2enmod rewrite

# Copy application source
COPY html/ /var/www/html/
RUN chown -R www-data:www-data /var/www/html/

EXPOSE 8000

CMD ["start-apache"]