PHP_VERSION=$(php -v | head -n 1 | cut -d " " -f 2 | cut -c 1-6)

echo "php: "$PHP_VERSION;