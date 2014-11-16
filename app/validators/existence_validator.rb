class ExistenceValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank? && record.send("#{attribute}_id".to_sym).blank?
      record.errors[attribute] << "must exist as an object or foreign key"
    end
  end
end
