CarrierWave.configure do |config|
  if Rails.env.test? or Rails.env.cucumber?
    config.storage = :file
    config.enable_processing = false

    CarrierWave::Uploader::Base.descendants.each do |klass|
      next if klass.anonymous?
      klass.class_eval do
        def cache_dir
          "#{Rails.root}/spec/support/uploads/tmp"
        end

        def store_dir
          "#{Rails.root}/spec/support/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
        end
      end
    end

  end

  if Rails.env.development?
    config.storage = :fog
    config.enable_processing = true
    config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => ENV['S3_ACCESS_KEY'],       # required
    :aws_secret_access_key  => ENV['S3_SECRET_KEY'],       # required
    :region                 => ENV['S3_REGION']  # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = ENV['S3_BUCKET']
    # config.fog_public     = true  
  end
  
  if Rails.env.production?
    config.storage = :fog
    config.enable_processing = true
    config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => ENV['S3_ACCESS_KEY'],       # required
    :aws_secret_access_key  => ENV['S3_SECRET_KEY'],       # required
    # :region                 => 'XXXX'  # optional, defaults to 'us-east-1'
    :region                 => ENV['S3_REGION']  # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = ENV['S3_BUCKET']
    # config.fog_public     = true  
  end
end
