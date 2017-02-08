FROM ubuntu:trusty

RUN apt-get update
RUN apt-get install -qy software-properties-common
RUN add-apt-repository ppa:brightbox/ruby-ng
RUN apt-get update
RUN apt-get install -qy ruby2.3 ruby2.3-dev build-essential cmake mysql-client libmysqlclient-dev libsasl2-dev
RUN mkdir -p /var/lib/cyclid /var/run/cyclid /etc/cyclid /var/log/cyclid
COPY files/cyclid-0.2.4.gem /tmp/

RUN gem install /tmp/cyclid-0.2.4.gem
RUN gem install mysql2
RUN gem install unicorn

COPY files/config /etc/cyclid/config
COPY files/sidekiq.rb /var/lib/cyclid/sidekiq.rb
COPY files/config.ru /var/lib/cyclid/config.ru
COPY files/unicorn.rb /var/lib/cyclid/unicorn.rb
COPY files/entrypoint.sh /entrypoint.sh
COPY files/wait-for-it.sh /wait-for-it.sh

CMD /entrypoint.sh
