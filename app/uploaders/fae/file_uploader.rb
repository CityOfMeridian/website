# encoding: utf-8
module Fae
  class FileUploader < CarrierWave::Uploader::Base
    storage :fog
    # Include RMagick support:
    include CarrierWave::RMagick
    include CarrierWave::MimeTypes

    process :set_content_type
    process :save_file_size_in_model

    # version :normal do
    #   process :pdf_conversion
    # end

    def save_file_size_in_model
      model.file_size = file.size
    end

    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      "city-of-meridian"
    end

    # Add a white list of extensions which are allowed to be uploaded.
    # For images you might use something like this:
    def extension_white_list
      %w(jpg jpeg gif png pdf)
    end

    def filename
      "pdf:#{changed_filename(super)}"
    end


    private

    def changed_filename(name)
      name.split('.').first
    end
  end
end
