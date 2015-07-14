class BedValidator < ActiveModel::EachValidator
  include BedValidatable

  def validate_each(record, attribute, value)
    record.errors.add(attribute, :bed_format, value: value, default: 'Wrong Ward') unless validate_bed(record, value)
  end
end
