class AvatarUploader < CarrierWave::Uploader::Base

  if Rails.env.production? || Rails.env.development?
    storage :fog
  else
    storage :file
  end

  def store_dir
    if Rails.env.development?
      "arts-bostonia-development"
    elsif Rails.env.production?
      "arts-bostonia-production"
    end
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
  
end
