# encoding: utf-8
module Fae
  class FileUploader < CarrierWave::Uploader::Base
    storage :fog
    # Include RMagick support:
    include CarrierWave::RMagick
    include CarrierWave::MimeTypes

    process :save_file_size_in_model
    process :convert => :pdf
    process :save_content_type


    def save_file_size_in_model
      model.file_size = file.size
    end

    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      "city-of-meridian/files/"
    end

    # Add a white list of extensions which are allowed to be uploaded.
    # For images you might use something like this:
    def extension_white_list
      %w(jpg jpeg gif png pdf)
    end

    def filename
      "#{changed_filename(super)}.pdf"
    end

    def save_content_type
      file.instance_variable_set(:@content_type, 'application/octect-stream')
    end

    private

    def changed_filename(name)
      name.split('.').first
    end
  end
end
