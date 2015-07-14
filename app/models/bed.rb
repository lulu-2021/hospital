class Bed < ActiveRecord::Base

  belongs_to :room, counter_cache: true

  has_one :ward, through: :room

  validates_associated :room
end
