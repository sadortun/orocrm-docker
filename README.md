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