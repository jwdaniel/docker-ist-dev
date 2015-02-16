FROM ubuntu:trusty
MAINTAINER Daniel Jian-Wei Wang <jwwang(at)isheriff.com>

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y \
 && apt-get install -y build-essential gettext vim subversion screen \
 && apt-get install -y openssh-server apache2 php5 php5-dev libapache2-mod-php5 php5-mcrypt php-pear \
 && apt-get install -y mysql-client php5-mysql mongodb-clients php5-mongo

# setup openssl-server
RUN mkdir /var/run/sshd \
 && echo 'root:root' | chpasswd \
 && sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
 && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# apache2 & php5 modules
RUN yes "" | pecl install mailparse memcache \
  && echo "extension=mailparse.so" > /etc/php5/mods-available/mailparse.ini \
  && echo "extension=memcache.so" > /etc/php5/mods-available/memcache.ini \
  && php5enmod mcrypt mailprase memcache \
  && a2enmod rewrite

# shared folder and startup script
VOLUME /data
ADD startup.sh /startup.sh
RUN chmod 755 /startup.sh

EXPOSE 22 80
CMD ["/startup.sh"]

