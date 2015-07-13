class Room < ActiveRecord::Base

  belongs_to :ward
  has_many :beds

  # needs to be less_than since it is validated after the counter_cache update
  validates :beds_count, numericality: { less_than: 4 }
end
