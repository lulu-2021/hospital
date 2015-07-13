class StablePatient < Patient

  validates :patient_type, ward_type: true
end
