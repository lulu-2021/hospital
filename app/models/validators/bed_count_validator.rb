class BedCountValidator < ActiveModel::EachValidator
  include BedCountValidatable

  def validate_each(record, attribute, value)
    record.errors.add(attribute, :bed_count_format, value: value, default: options[:message]) unless validate_bed_count(value)
  end
end
