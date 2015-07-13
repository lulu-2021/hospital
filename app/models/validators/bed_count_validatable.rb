module BedCountValidatable

  def validate_bed_count(value)
    value <= 4
  end
end
