
echo '▓░░░░░ Install linux packages'
sudo apt-get update
sudo apt-get install docker docker-compose composer php

echo '▓▓░░░░ Install/Init Linux Centos 7 on Docker'
docker-compose up --build -d

echo '▓▓▓░░░ Install laravel'
composer create-project --prefer-dist laravel/laravel project
cp -a project/. ./

echo '▓▓▓▓░░ Cleaner temporary files'
rm -rf project

echo '▓▓▓▓▓░ Add permissions on storage and logs'
docker-compose exec php chmod -R ug+rwx storage bootstrap/cache logs
docker-compose exec php chgrp -R apache storage bootstrap/cache logs

echo '▓▓▓▓▓▓ Done! Access navigator with your ip address'
