FROM ubuntu:trusty

RUN apt-get update
RUN apt-get install -qy software-properties-common
RUN add-apt-repository ppa:brightbox/ruby-ng
RUN apt-get update
RUN apt-get install -qy ruby2.3 ruby2.3-dev build-essential cmake mysql-client libmysqlclient-dev libsasl2-dev
RUN mkdir -p /var/lib/cyclid /var/run/cyclid /etc/cyclid /var/log/cyclid /var/lib/cyclid-ui
COPY files/cyclid-0.2.4.gem /tmp/

RUN gem install /tmp/cyclid-0.2.4.gem
RUN gem install cyclid-ui
RUN gem install mysql2
RUN gem install unicorn
RUN ln -s $(cyclid-ui-assets) /var/lib/cyclid-ui/public

COPY files/config /etc/cyclid/config
COPY files/sidekiq.rb /var/lib/cyclid/sidekiq.rb
COPY files/config-server.ru /var/lib/cyclid/config.ru
COPY files/config-ui.ru /var/lib/cyclid-ui/config.ru
COPY files/unicorn-server.rb /var/lib/cyclid/unicorn.rb
COPY files/unicorn-ui.rb /var/lib/cyclid-ui/unicorn.rb
COPY files/entrypoint.sh /entrypoint.sh
COPY files/wait-for-it.sh /wait-for-it.sh
RUN chmod +x /entrypoint.sh /wait-for-it.sh

CMD /entrypoint.sh
