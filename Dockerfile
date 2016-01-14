FROM ubuntu:14.04
MAINTAINER Ivan Matveev <ivan.matveev@student.emw.hs-anhalt.de>
RUN apt-get update && apt-get install -y git apache2 apache2-utils vim
ADD 172.17.42.1.conf /etc/apache2/sites-enabled/172.17.42.1.conf
RUN a2enmod ssl cgi alias env
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

