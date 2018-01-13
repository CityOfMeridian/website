module Admin
  module RolesHelper

    def to_class(attribute)
      begin
        attribute.to_s.classify.constantize
      rescue
        "Fae::#{attribute.to_s.classify}".constantize
      end
    end

    def list_order(f, attribute, options)
      if is_association?(f, attribute) && !options[:collection]
        begin
          options[:collection] = to_class(attribute).for_fae_index
        rescue NameError
          raise "Fae::MissingCollection: `#{attribute}` isn't an orderable class, define your order using the `collection` option."
        end
      end
    end
  end
end