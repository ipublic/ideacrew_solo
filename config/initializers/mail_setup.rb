#Configure ActionMailer settings

# config.action_mailer.raise_delivery_errors = true
# config.action_mailer.delivery_method = :smtp
# config.action_mailer.smtp_settings = {
#   :address              => "smtp.1and1.com",
#   :port                 => 25,
#   :domain               => 'ipublic.org',
#   :user_name            => 'noreply@ipublic.org',
#   :password             => 'kermit12',
#   :authentication       => :login,
#   :enable_starttls_auto => true  }

# ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :sendmail
#ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.1and1.com",
  :domain               => 'ideacrew.com',
  :user_name            => 'noreply@ideacrew.com',
  :password             => 'kermit12'
  # :authentication       => :plain,
  # :port                 => 25,
  # :openssl_verify_mode  => 'none',
  # :enable_starttls_auto => true
  }
