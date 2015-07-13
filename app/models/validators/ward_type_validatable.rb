module WardTypeValidatable

  def validate_ward_type(record, value)
    patient_type = value.underscore.split('_').first
    if record.ward_id
      # - if we have a ward - it needs to match the patient on TYPE!
      ward_type = Ward.find(record.ward_id).ward_type.underscore.split('_').first
      return patient_type == ward_type
    else
      return true
    end
  end
end
