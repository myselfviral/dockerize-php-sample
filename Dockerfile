FROM ubuntu:16.04

#update Repository
RUN apt-get update -y

#install Apache
RUN apt-get install -y apache2

#instal PHP Module
RUN apt-get install -y php7.0 libapache2-modphp7.0 php7.0-cli php7.0-common php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-zip


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