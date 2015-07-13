class Patient < ActiveRecord::Base
  # this tells Rails we have STI based children that are identified by this col
  # and rails automatically adds the Class name of the child into this col
  self.inheritance_column = :patient_type

  has_one :bed
end
