CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider  => 'AWS',  # required
    :aws_access_key_id  => ENV['AWS_ACCESS_PROJECT_KEY_ID'],  # required
    :aws_secret_access_key  => ENV['AWS_ACCESS_PROJECT_SECRET_KEY'],  # required
    :region => 'eu-west-1',  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = ENV['AWS_ACCESS_BETIP_BUCKET'] # required
  config.fog_public  = true  # optional, defaults to true
end