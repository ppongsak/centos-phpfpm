FROM centos:7

# install PHP and extensions
RUN yum clean all; yum -y update; \
yum -y --enablerepo=remi,remi-php70 install php php-fpm php-cli \
php-bcmath \
php-dom \
php-gd \
php-json \
php-ldap \
php-mbstring \
php-mcrypt \
php-mysqlnd \
php-opcache \
php-pdo \
php-pdo-dblib \
php-pecl-geoip \
php-pecl-memcache \
php-pecl-memcached \
php-pecl-redis \
php-zip; \
yum clean all

# install Composer and plugins
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc

# docker build --rm -t centos-phpfpm .
