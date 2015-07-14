class Patient < ActiveRecord::Base
  # this tells Rails we have STI based children that are identified by this col
  # and rails automatically adds the Class name of the child into this col
  self.inheritance_column = :patient_type

  belongs_to :bed
  belongs_to :ward

  validates :patient_type, ward_type: true

  validates :bed_id, bed: true

  validates_presence_of :patient_type
end
