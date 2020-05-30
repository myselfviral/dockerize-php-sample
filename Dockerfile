FROM ubuntu:18.04

#update Repository
RUN apt-get update -y

#install Apache
RUN apt-get install -y apache2

#instal PHP Module
RUN apt-get install -y php7.3 php7.3-common php7.3-opcache php7.3-cli php7.3-gd php7.3-curl php7.3-mysql

#Copy Application Files
RUN rm -rf /var/www/html/*
ADD dockerize-php-sample /var/www/html/*

#configure Apache (Optional)
RUN chown -R www-data:www-data /var/www/html/*
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_RUN_DIR /var/log/apache2

#open port 80
EXPOSE 80

#start Apache Service
CMD ["/user/sbin/apache2ctl","-D", "FOREGROUND"]