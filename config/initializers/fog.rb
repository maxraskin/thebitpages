CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAIW4HU5GWGL7HY6WQ',                        # required
    :aws_secret_access_key  => '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',                        # required
    :region                 => 'us-east-1'                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'bitpages'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end