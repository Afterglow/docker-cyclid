FROM ubuntu:trusty

RUN apt-get update
RUN apt-get install -qy software-properties-common
RUN add-apt-repository ppa:brightbox/ruby-ng
RUN apt-get update
RUN apt-get install -qy ruby2.3 ruby2.3-dev build-essential cmake mysql-client libmysqlclient-dev libsasl2-dev
RUN mkdir -p /var/run/cyclid /etc/cyclid /var/log/cyclid /var/lib/cyclid-ui

RUN gem install cyclid-ui
RUN gem install unicorn
RUN ln -s $(cyclid-ui-assets) /var/lib/cyclid-ui/public

COPY files/config /etc/cyclid/config
COPY files/config.ru /var/lib/cyclid-ui/config.ru
COPY files/unicorn.rb /var/lib/cyclid-ui/unicorn.rb

CMD unicorn -E production -c /var/lib/cyclid-ui/unicorn.rb
