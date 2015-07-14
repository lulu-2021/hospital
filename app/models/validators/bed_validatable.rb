module BedValidatable

  def validate_bed(record, value)
    if record.bed
      record.ward_id == record.bed.ward.id
    else
      true
    end
  end
end
