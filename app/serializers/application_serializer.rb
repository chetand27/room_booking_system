class ApplicationSerializer < ActiveModel::Serializer
  def self.formatted_date(options = {})
    attribute = options[:attribute] || nil
    format = options[:format] || "%F"

    if attribute.present?
     define_method(attribute) do
       object[attribute].strftime(format)
     end
    end
  end
end