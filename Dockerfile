FROM centos:7

# install PHP and extensions
RUN yum clean all; yum -y update; \
    rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm \
    yum -y --enablerepo=remi,remi-php70w install nginx php70w-cli php70w-devel php70w-fpm php70w-gd php70w-mbstring php70w-mcrypt php70w-mysql php70w-pear php70w-opcache php70w-common \
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
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

# docker build --rm -t centos-phpfpm .
# sudo docker run --name=web1 -d  -p 127.0.0.1:80:80 -v /Users/pongsak/Projects/rebate-mango/docker/php-web:/var/www centos-phpfpm:1.0