FROM php:5.6-apache


ENV OROCRM_GIT_URL https://github.com/orocrm/crm-application.git
ENV OROCRM_VERSION 1.7.6

# Install needed software and dependencies
RUN DEBIAN_FRONTEND=noninteractive \
apt-get update && \
apt-get install -qy \
git \
libicu-dev \
libmcrypt-dev \
libpng-dev \
libxml2-dev && \
apt-get clean

# Install PHP extensions
RUN docker-php-ext-install \
gd \
intl \
mbstring \
mcrypt \
opcache \
pdo_mysql \
soap \
zip

# Install and setup composer
RUN curl -sS https://getcomposer.org/installer | php && \
mv composer.phar /usr/local/bin/composer  

# Download sources
WORKDIR /var/www/orocrm
RUN git clone -b $OROCRM_VERSION $OROCRM_GIT_URL .

# Copy configs and scripts
COPY config/php.ini /usr/local/etc/php/

# Get dependencies
RUN composer install
RUN ln -s /usr/bin/nodejs /usr/bin/node && \

RUN chown -R www-data:www-data web app/cache app/config/parameters.yml app/logs
RUN rm -rf /var/www/html && ln -s /var/www/orocrm/web /var/www/html
RUN a2enmod rewrite

VOLUME /var/www/orocrm/src

EXPOSE 80
CMD ["apache2-foreground"]