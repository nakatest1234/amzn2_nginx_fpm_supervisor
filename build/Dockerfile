FROM amazonlinux:2
MAINTAINER nakatest1234 <ambient2step@gmail.com>

COPY ./docker-entrypoint.sh /

RUN amazon-linux-extras install -y php7.3=7.3.6 \
  && amazon-linux-extras install -y nginx1.12=1.12.2 \
  && yum -y -q install php-bcmath php-exif php-gd php-mbstring php-opcache php-xml php-pecl-apcu php-pecl-mcrypt php-pecl-memcached php-pecl-zip unzip \
  && yum -y -q install python-pip python-setuptools \
  && yum -y -q install cronie \
  && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && echo 'apc.filters="^phar://"' >> /etc/php.d/40-apcu.ini \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
  && chmod +x /docker-entrypoint.sh \
  && /usr/bin/easy_install supervisor \
  && curl -sL https://toolbelt.treasuredata.com/sh/install-amazon2-td-agent3.sh | sed 's/^sudo -k//g' | sed 's/^sudo sh/sh/g' | sh \
  && /usr/sbin/td-agent-gem install --no-document fluent-plugin-record-reformer \
  && /usr/sbin/td-agent-gem install --no-document fluent-plugin-record-modifier \
  && /usr/sbin/td-agent-gem install --no-document fluent-plugin-forest \
  && /usr/sbin/td-agent-gem install --no-document fluent-plugin-rewrite -v 0.0.13 \
  && /usr/sbin/td-agent-gem install --no-document fluent-plugin-slack \
  && /usr/sbin/td-agent-gem install --no-document fluent-plugin-s3 \
  && /usr/sbin/td-agent-gem install --no-document fluent-plugin-config-expander \
  && /usr/sbin/td-agent-gem install --no-document fluent-plugin-chatwork \
  && yum clean all -q


EXPOSE 80
EXPOSE 9000
ENTRYPOINT ["/docker-entrypoint.sh"]
