  CarrierWave.configure do |config2|
    config2.storage = :fog
    config2.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: ENV.fetch('DREAMOBJECTS_PUBLIC_KEY'),
      aws_secret_access_key: ENV.fetch('DREAMOBJECTS_SECRET_KEY'),
      region: 'us-west-1',
      host: 'objects-us-west-1.dream.io',
      # this is the real kicker...
      # if you don't do this you'll just keep getting 400 bad request returned
      # see https://github.com/fog/fog/issues/3275 for more details
      aws_signature_version: 2
    }
    # bucket name from above...
    config2.fog_public = true
    config2.fog_directory = 'city-of-meridian'
    # include bucket name from above in url...
    config2.asset_host = "http://assets.meridiantx.xyz"
    # this is a heroku thing - you may or may not need to consider this 
    config2.cache_dir = "#{Rails.root}/tmp/uploads"
  end