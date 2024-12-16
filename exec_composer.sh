echo "%%%%%%%" | sudo -S echo "password"
sudo update-alternatives --set php /usr/bin/php$1
dirname=$(dirname $0)
cp $dirname/installer $dirname/composer-setup.php
php -r "if (hash_file('sha384', '$dirname/composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('$dirname/composer-setup.php'); } echo PHP_EOL;"
php $dirname/composer-setup.php
php -r "unlink('$dirname/composer-setup.php');"
sudo cp composer.phar /usr/bin/composer
rm composer.phar
php -v
