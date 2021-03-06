# Settings specified here will take precedence over those in config/environment.rb

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true

# Use a different logger for distributed setups
# config.logger = SyslogLogger.new

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true

config.action_controller.session_store = :active_record_store

config.action_view.cache_template_loading = true

# Enable serving of images, stylesheets, and javascripts from an asset server
# config.action_controller.asset_host                  = "http://assets.example.com"

# Disable delivery errors, bad email addresses will be ignored
# config.action_mailer.raise_delivery_errors = false

config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
    :enable_starttls_auto => true,
    :address => APP_CONFIG["mail_address"],
    :port => 587,
    :user_name => APP_CONFIG['mail_user'],
    :password => APP_CONFIG['mail_password'],
    :domain => APP_CONFIG['mail_domain'],
    :authentication => :login
    }
