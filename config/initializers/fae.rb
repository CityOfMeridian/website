Fae.setup do |config|
  config.devise_secret_key = '56f0ec8bbcea4db9b36126d85365a65de52ca8b5d55292ce29381bc4a772d0314c80efef4af60246fd8774af57fef7cee3bc1976eedb3e082d0442ae82d39b05'
  CarrierWave.configure do |config2|
      config2.provider = 'fog/aws'
      config2.fog_credentials = {
        provider: "AWS",
        aws_access_key_id: ENV.fetch('DREAMOBJECTS_PUBLIC_KEY'),
        aws_secret_access_key: ENV.fetch('DREAMOBJECTS_SECRET_KEY'),
        region: 'us-west-1'
        host: 'objects-us-west-1.dream.io',
        # this is the real kicker...
        # if you don't do this you'll just keep getting 400 bad request returned
        # see https://github.com/fog/fog/issues/3275 for more details
        aws_signature_version: 2
      }
    # bucket name from above...
    config2.fog_public = true
    # include bucket name from above in url...
    config2.asset_host = "http://city-of-meridian.objects-us-west-1.dream.io"
    # this is a heroku thing - you may or may not need to consider this 
    config2.cache_dir = "#{Rails.root}/tmp/uploads"
  end
module Fae
  class ImageUploader < CarrierWave::Uploader::Base
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  end
end
  ## devise_mailer_sender
  # This email address will get passed to Devise and
  # used as the from address in the password reset emails.
  # config.devise_mailer_sender = 'change-me@example.com'

  ## dashboard_exclusions
  # The dashboard will show all objects with recent activity.
  # To exclude any objects, add them to this array.
  # config.dashboard_exclusions = %w( Gallery )

  ## max_image_upload_size
  # This will set a file size limit on image uploads in MBs.
  # The default is 2 MB.
  # config.max_image_upload_size = 2

  ## max_file_upload_size
  # This will set a file size limit on file uploads in MBs.
  # The default is 5 MB.
  # config.max_file_upload_size = 5

  ## languages
  # This hash sets the supported languages for the multiple
  # language toggle feature.
  # config.languages = {
  #   en: 'English',
  #   zh: 'Chinese'
  # }

  ## recreate_versions
  # Triggers `Fae::Image` to recreate Carrierwave versions after save.
  # Defaults to false
  # config.recreate_versions = false

  ## track_changes
  # This is the global toggle for the change tracker.
  # Defaults to true
  # config.track_changes = true

  ## tracker_history_length
  # This defines how many changes per object are kept in the DB
  # via the change tracker.
  # Defaults to 15
  # config.tracker_history_length = 15

  ## disabled_environments
  # This option will disable Fae complete when the app is running
  # on one of the defined environments
  # config.disabled_environments = [ :preview, :staging ]

  ## per_page
  # Sets the default number of items shown in paginated lists
  # Defaults to 25
  # config.per_page = 25

  ## use_cache
  # Determines whether or not Fae will utilize cache internally.
  # Note: you still need to enable `perform_caching` and set a `cache_store`
  # on the parent app
  # Defaults to false
  # config.use_cache = true
end


