class Bed < ActiveRecord::Base
  belongs_to :patient
  belongs_to :room, counter_cache: true

  has_one :ward, through: :room

  scope :by_patient_id, -> (patient_id) { where('patient_id = ?', patient_id) }

  validates_associated :room
end
