FROM centos:7

# install PHP and extensions
RUN yum clean all; yum -y update; \
    yum -y install epel-release http://rpms.remirepo.net/enterprise/remi-release-7.rpm; \
    yum -y --enablerepo=remi,remi-php72 install php \
    php-fpm \
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
    php-zip \
    php-iconv \
    php-openssl \
    yum -y update; \
    yum clean all; \
    php --version;

# create /tmp/lib/php
RUN mkdir -p /tmp/lib/php/session; \
    mkdir -p /tmp/lib/php/wsdlcache; \
    mkdir -p /tmp/lib/php/opcache; \
    mkdir /root/.composer; \
    chmod 777 -R /tmp/lib/

# add custom config
COPY ./php/php.ini /etc/php.ini
COPY ./php/www.conf /etc/php-fpm.d/www.conf

RUN chmod 777 -R /etc/php-fpm.d ; \
    mkdir /var/run/php-fpm

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && \
    python get-pip.py

# install Composer and plugins
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

# docker build --rm -t centos-phpfpm .
# sudo docker run --name=web1 -d  -p 127.0.0.1:80:80 -v /Users/pongsak/Projects/rebate-mango/docker/php-web:/var/www centos-phpfpm:1.0