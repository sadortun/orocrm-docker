# orocrm-docker

# Run OroCRM Application with Docker CLI
1. Run DB container:

         docker run --name mysql56_orocrm 
         -e MYSQL_ROOT_PASSWORD={set root password}
         -e MYSQL_DATABASE=orocrm 
         -e MYSQL_USER=orocrm
         -e MYSQL_PASSWORD={set user password} 
         -d mysql:5.6


2. Run application container and link DB:

         docker run 
         --name orocrm
         -p 80:80
         --link mysql56_orocrm:{DB alias}
         -d olidac/orocrm

Set {DB alias} to any value you want and use it as DB hostname during installation.

with volume for cache and logs :
docker run --name orocrm -v /var/www/orocrm/app/cache -v /var/www/orocrm/app/logs -p 80:80 --link mysql56_orocrm:dboro -d olidac/orocrm:1.7.6

# Notes
As an application in this image is not installed, you have to proceed with web installer instructions.