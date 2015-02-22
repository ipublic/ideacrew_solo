root = "/home/deploy/www/ideacrew.com/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.ideacrew.com.sock"
worker_processes 4
timeout 30

# Force the bundler gemfile environment variable to
# reference the capistrano "current" symlink
before_exec do |_|
  ENV["BUNDLE_GEMFILE"] = File.join(root, 'Gemfile')
end

# working_directory "/var/www/ideacrew/current"
# pid "/var/www/ideacrew/shared/pids/unicorn.pid"
# stderr_path "/var/www/ideacrew/shared/log/unicorn.log"
# stdout_path "/var/www/ideacrew/shared/log/unicorn.log"

# listen "/tmp/unicorn.ap.sock"
# worker_processes 2
# timeout 180
