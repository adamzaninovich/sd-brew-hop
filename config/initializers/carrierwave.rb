S3_CONFIG = ConfigLoader.load_config :s3

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: S3_CONFIG[:id],
    aws_secret_access_key: S3_CONFIG[:secret]
  }
  config.fog_directory  = S3_CONFIG[:bucket]
  config.cache_dir = "#{Rails.root}/tmp/uploads"
end
