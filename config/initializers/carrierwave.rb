CarrierWave.configure do |config|
  config.fog_provider = 'fog/google'                        # required
  config.fog_credentials = {
    provider:                         'Google',
    google_storage_access_key_id:     Settings.google.storage.access_key_id,
    google_storage_secret_access_key: Settings.google.storage.secret_access_key
  }
  config.fog_directory = Settings.google.storage.bucket
end
