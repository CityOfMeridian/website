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
      config.dsn = 'https://ab70bfc9799e48fa973284d37697865c:e0ce02e98ee243b6b3f754d5a0484d30@sentry.io/237465'
    end
    config.time_zone = 'Central Time (US & Canada)'
    config.exceptions_app = self.routes
  end
end
