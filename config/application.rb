require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CityOfMeridian
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # config.load_defaults 5.0
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    Raven.configure do |config|
      config.dsn = ENV.fetch('SENTRY_DSN')
    end
    config.time_zone = 'Central Time (US & Canada)'
    config.exceptions_app = self.routes
    config.cache_classes = false
    config.action_mailer.perform_caching = false

    # Ignore bad email addresses and do not raise email delivery errors.
    # Set this to true and configure the email server for immediate delivery to raise delivery errors.
    config.action_mailer.raise_delivery_errors = false

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.default_options = { from: 'info@meridiantexas.us' }
    config.action_mailer.smtp_settings = {
    address:              'sub5.mail.dreamhost.com',
    port:                 587,
    domain:               'meridiantexas.us',
    user_name:            'info@meridiantexas.us',
    password:             ENV.fetch('DREAMHOST_PASSWORD'),
    authentication:       :login,
    enable_starttls_auto: false  
    }
    config.active_job.queue_adapter     = :delayed_job
    
  end
end
