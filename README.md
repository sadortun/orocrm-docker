# orocrm-docker

# Run OroCRM Application with Docker CLI
1. Run DB container:

         docker run --name mysql56_orocrm 
         -e MYSQL_ROOT_PASSWORD={set root password}
         -e MYSQL_DATABASE=oro_crm 
         -e MYSQL_USER=orocrm
         -e MYSQL_PASSWORD=orocrm 
         -d mysql:5.6


2. Run application container and link DB:

         docker run 
         --name orocrm
         -p 80:80
         --link mysql56_orocrm:dborocrm
         -d olidac/orocrm


If the DB container is stopped, start it with : docker start mysql56_orocrm

url install : /app_nocache.php/installer

# Notes
As an application in this image is not installed, you have to proceed with web installer instructions.

# Commands
docker run --name mysql56_orocrm -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=oro_crm -e MYSQL_USER=orocrm -e MYSQL_PASSWORD=orocrm -d mysql:5.6
docker run --name orocrm -p 80:80 --link mysql56_orocrm:dborocrm -d olidac/orocrm:1.7.6

docker exec -it orocrm bash

app/console oro:install --env=prod --organization-name=Acme --user-name=admin --user-email=admin@example.com --user-firstname=John --user-lastname=Doe --user-password=admin --sample-data=y --application-url=http://localhost/oro --drop-database --timeout=3600 && chown -R www-data:www-data web/js web/css

rm -rf app/cache/* && app/console cache:warmup --env=dev && chown -R www-data:www-data app/cache