FROM ubuntu:trusty

RUN apt-get update
RUN apt-get install -qy software-properties-common
RUN add-apt-repository ppa:brightbox/ruby-ng
RUN apt-get update
RUN apt-get install -qy ruby2.3 ruby2.3-dev build-essential cmake mysql-client libmysqlclient-dev libsasl2-dev
RUN mkdir -p /var/lib/cyclid /var/run/cyclid /etc/cyclid /var/log/cyclid

RUN gem install cyclid
RUN gem install mysql2

COPY files/config /etc/cyclid/config
COPY files/sidekiq.rb /var/lib/cyclid/sidekiq.rb

CMD sidekiq -e production -d -P /var/run/cyclid/sidekiq.pid -L /var/log/sidekiq.log -r /var/lib/cyclid/sidekiq.rb
