#!/usr/bin/env bash

if [ ! -f /.dbinit ]; then
  echo "CREATE DATABASE cyclid" | mysql -u root --password=cyclid -h cyclid-db
  cyclid-db-init fe150f3939ed0419f32f8079482380f5cc54885a381904c15d861e8dc5989286 cyclid && touch .dbinit
fi

unicorn -E production -c /var/lib/cyclid/unicorn.rb
