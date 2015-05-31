# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'ideacrew'
# set :stage, 'production'
# set :rails_env, :production
set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"
set :deploy_user, "deploy"
set :scm, :git
set :repo_url, 'git@github.com:ipublic/ideacrew_solo.git'

# set :executable_config_files, %w(config/unicorn_init.sh)

# Default value for :linked_files is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :linked_files, fetch(:linked_files, []).push('config/secrets.yml')

# Default value for default_env is {}
set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH", 
                    gem_path: "/home/deploy/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0" }

# Default value for :pty is false
set :pty, true  # need this for sudo

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/#{fetch(:deploy_user)}/www/#{fetch(:full_app_name)}"
set :keep_releases, 5

# capistrano/rbenv setup
set :rbenv_roles, :all
set :rbenv_type, :user
set :rbenv_path, "~/.rbenv"
set :rbenv_ruby, "2.1.2"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}

# capistrano/rails setup
set :assets_roles, [:web, :app]

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

namespace :deploy do

  after 'deploy:publishing', 'deploy:restart'
  namespace :deploy do
    task :restart do
      invoke 'unicorn:reload'
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
