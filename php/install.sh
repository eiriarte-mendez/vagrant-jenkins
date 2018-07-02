#!/bin/bash

if [ -f /opt/box/.php ] ; then
    echo ">> php: installed and configured"
else
    echo ">> php: install"
    apt-get install -y php \
        php-xdebug \
        php-xml \
        php-gd \
        php-mbstring \
        php-mcrypt \
        php-zip \
        php-xml

    touch /opt/box/.php
fi

if [ -f /opt/box/.composer ] ; then
    echo ">> php: installed and configured"
else
    echo ">> composer: install"
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer
    rm -rf composer-setup.php

    curl -L https://cs.sensiolabs.org/download/php-cs-fixer-v2.phar -o /usr/local/bin/php-cs-fixer
    chmod a+x /usr/local/bin/php-cs-fixer

    touch /opt/box/.composer
fi

if [ -f /opt/box/.php-tools ] ; then
    echo ">> php-tools: installed"
else
    echo ">> php-tools: install"
    chmod a+x /vagrant/php/php-tools.sh
    su --login -c "/vagrant/php/php-tools.sh" jenkins
    su --login -c "echo 'export PATH=\$HOME/.config/composer/cache/vendor/bin:\$PATH >> .profile" jenkins
    
    touch /opt/box/.php-tools
fi
