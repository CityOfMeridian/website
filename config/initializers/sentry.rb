require 'raven'

Raven.configure do |config|
  # other stuff

  # Workaround a bug where this was being set to "default" instead of "development" in some scenarios.
  config.current_environment = Rails.env
end 