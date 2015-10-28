CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              "AWS",
    aws_access_key_id:     Rails.application.secrets.amazon_key,
    aws_secret_access_key: Rails.application.secrets.amazon_secret,

  }
  config.fog_directory  = "flashcards-storage"
end
