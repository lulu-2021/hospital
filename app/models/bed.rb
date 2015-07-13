class Bed < ActiveRecord::Base
  belongs_to :patient
  belongs_to :room, counter_cache: true

  validates_associated :room
end
