FROM php:8.1-apache

# Copy source
COPY . /var/www/html/

# Install common PHP extensions miniProxy may need
RUN apt-get update \
    && apt-get install -y --no-install-recommends libzip-dev zip \
    && docker-php-ext-install mbstring curl \
    && rm -rf /var/lib/apt/lists/*

# Enable necessary Apache mods
RUN a2enmod rewrite

# Add entrypoint that sets Apache to listen on Render's $PORT
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]