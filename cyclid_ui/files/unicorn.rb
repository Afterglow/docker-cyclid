working_directory "/var/lib/cyclid-ui"
pid "/var/run/unicorn.cyclid-ui.pid"

stderr_path "/var/log/cyclid/unicorn.cyclid-ui.log"
stdout_path "/var/log/cyclid/unicorn.cyclid-ui.log"

listen 80
#listen "/var/run/unicorn.cyclid-ui.sock"

worker_processes 4
timeout 10
