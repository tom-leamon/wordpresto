FROM wordpress

RUN apt-get update && \
    apt-get install -y libxml2-dev

RUN docker-php-ext-install soap

COPY php.ini /usr/local/etc/php