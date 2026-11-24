FROM php:7.4-cli

# ضبط مستودعات الأرشيف الخاصة بدبيان لتفادي أخطاء التحميل
RUN echo "deb http://archive.debian.org/debian bullseye main" > /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security bullseye-security main" >> /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Time \"false\";" > /etc/apt/apt.conf.d/99archive

# تثبيت Git والامتدادات المطلوبة
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    unzip

RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html
