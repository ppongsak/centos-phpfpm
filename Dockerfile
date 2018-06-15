FROM centos:7

# install PHP and extensions
RUN yum clean all; yum -y update; \
    yum -y install epel-release http://rpms.remirepo.net/enterprise/remi-release-7.rpm; \
    yum -y --enablerepo=remi,remi-php71 install php \
    php-fpm \
    pph-cli \
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
    rm -rf /var/run/php-fpm; \
    mkdir /var/run/php-fpm

# docker build --rm -t centos-phpfpm .
# sudo docker run --name=web1 -d  -p 127.0.0.1:80:80 -v /Users/pongsak/Projects/rebate-mango/docker/php-web:/var/www centos-phpfpm:1.0