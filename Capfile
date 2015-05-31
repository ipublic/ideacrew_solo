# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

# Includes tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/unicorn_nginx'
# require 'capistrano/rails/assets'
# require 'capistrano/rails/migrations'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

# require 'capistrano/cookbook'
# require 'capistrano/cookbook/compile_assets_locally'
# require 'capistrano/cookbook/create_database'
# require 'capistrano/cookbook/logs'
# require 'capistrano/cookbook/monit'
# require 'capistrano/cookbook/nginx'
# require 'capistrano/cookbook/restart'
# require 'capistrano/cookbook/run_tests'
# require 'capistrano/cookbook/setup_config'

# # Load custom task helper functions
# Dir.glob('lib/capistrano/**/*.rb').each { |r| import r }
