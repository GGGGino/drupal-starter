FROM wodby/drupal-php:7.4-4.19.3

# install the PHP extensions we need
#RUN apt-get update \
#  && apt-get install -y \
#    libpng-dev libjpeg-dev libpq-dev vim default-mysql-client \
#  && rm -rf /var/lib/apt/lists/* \
#  && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
#  && docker-php-ext-install gd mbstring pdo pdo_mysql mysqli pdo_pgsql zip

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/

RUN composer global require drush/drush \
    && composer global update

WORKDIR /var/www/html

COPY ./initializer /root/initializer

RUN ln -s /root/initializer/corilla_drupal_install.sh /usr/local/bin/codruin

# https://www.drupal.org/node/3060/release
# ENV DRUPAL_VERSION 9.2
# ENV DRUPAL_MD5 c6fb49bc88a6408a985afddac76b9f8b
# ENV PATH "$PATH:/root/.composer/vendor/bin"
# ENV MYSQL_HOST mysql
# ENV MYSQL_ROOT_PASS "cori2021"
