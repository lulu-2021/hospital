class WardTypeValidator < ActiveModel::EachValidator
  include WardTypeValidatable

  def validate_each(record, attribute, value)
    record.errors.add(attribute, :ward_type_format, value: value, default: options[:message]) unless validate_ward_type(record, value)
  end
end
