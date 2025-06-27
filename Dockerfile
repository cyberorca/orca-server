FROM dunglas/frankenphp:latest

WORKDIR /app

# Install tools and PHP extensions
RUN apt-get update && apt-get install -y \
    git unzip zip libzip-dev \
    && docker-php-ext-install zip pcntl \
    && rm -rf /var/lib/apt/lists/*

# Set Git to allow mounted repo
RUN git config --global --add safe.directory /app

COPY . .

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
