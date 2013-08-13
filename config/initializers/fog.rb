CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJSKFHN3NBUO7VSBA',                        # required
    :aws_secret_access_key  => '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',                        # required
    :region                 => 'us-east-1'                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'bitpages'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end