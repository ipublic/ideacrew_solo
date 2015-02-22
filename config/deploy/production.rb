# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{deploy@ideacrew.com}
role :web, %w{deploy@ideacrew.com}
role :db,  %w{deploy@ideacrew.com}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

# server 'ideacrew.com', user: 'deploy', roles: %w{web app}, my_property: :my_value

# set :production

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
set :branch, "master"
set :deploy_user, "deploy"

# used when deploying multiple versions of the same app
# side by side. Also provides quick sanity checks when looking
# at filepaths
set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"
set :server_name, "ideacrew.com"

# server 'www.ideacrew.com', user: 'deploy', roles: %w{web app db}, primary: true
# server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value

set :deploy_to, "/home/#{fetch(:deploy_user)}/www/#{fetch(:full_app_name)}"

# dont try and infer something as important as environment from
# stage name.
set :rails_env, :production

# number of unicorn workers, this will be reflected in
# the unicorn.rb and the monit configs
set :nginx_server_name, "ideacrew.com"
set :unicorn_workers, 4

# whether we're using ssl or not, used for building nginx
# config file
set :enable_ssl, false


# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# And/or per server (overrides global)
# ------------------------------------
server 'ideacrew.com',
  user: 'deploy',
  roles: %w{web app},
  ssh_options: {
    # keys: %w(/Users/dthomas/ec2/dt_ideacrew),
    auth_methods: %w(publickey)
}

# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
