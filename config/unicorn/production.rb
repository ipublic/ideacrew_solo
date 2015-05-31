working_directory "/home/deploy/www/ideacrew_production/current"
pid "/home/deploy/www/ideacrew_production/shared/tmp/pids/unicorn.pid"
stdout_path "/home/deploy/www/ideacrew_production/shared/log/unicorn.stdout.log"
stderr_path "/home/deploy/www/ideacrew_production/shared/log/unicorn.stderr.log"

listen "/tmp/unicorn.ideacrew_production.sock"

worker_processes 2
timeout 30

preload_app true

before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "/home/deploy/www/ideacrew_production/current/Gemfile"
end

before_fork do |server, worker|
  # Disconnect since the database connection will not carry over
  if defined? ActiveRecord::Base
    ActiveRecord::Base.connection.disconnect!
  end

  # Quit the old unicorn process
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end

  if defined?(Resque)
    Resque.redis.quit
  end

  sleep 1
end

after_fork do |server, worker|
  # Start up the database connection again in the worker
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end

  if defined?(Resque)
    Resque.redis = 'localhost:6379'
  end
end
~                                                                                                                                                                        


# app_path = "/home/deploy/www/ideacrew_production"
# working_directory = "#{app_path}/current"
# pid "#{working_directory}/tmp/pids/unicorn.pid"

# listen "/tmp/unicorn.ideacrew.com.sock", :backlog => 64
# worker_processes 4

# # logging
# stderr_path "#{working_directory}/log/unicorn.log"
# stdout_path "#{working_directory}/log/unicorn.log"

# timeout 30

# # use correct gemfile on restarts
# before_exec do |server|
#   ENV["BUNDLE_GEMFILE"] = "#{working_directory}/Gemfile"
#   # ENV["BUNDLE_GEMFILE"] = File.join(app_path, 'Gemfile')
# end

# # preload
# preload_app true

# before_fork do |server, worker|
#   # the following is highly recomended for Rails + "preload_app true"
#   # as there's no need for the master process to hold a connection
#   if defined?(ActiveRecord::Base)
#     ActiveRecord::Base.connection.disconnect!
#   end

#   # Before forking, kill the master process that belongs to the .oldbin PID.
#   # This enables 0 downtime deploys.
#   old_pid = "#{server.config[:pid]}.oldbin"
#   if File.exists?(old_pid) && server.pid != old_pid
#     begin
#       Process.kill("QUIT", File.read(old_pid).to_i)
#     rescue Errno::ENOENT, Errno::ESRCH
#       # someone else did our job for us
#     end
#   end
# end

# after_fork do |server, worker|
#   if defined?(ActiveRecord::Base)
#     ActiveRecord::Base.establish_connection
#   end
# end