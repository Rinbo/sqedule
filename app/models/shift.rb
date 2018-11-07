class Shift < ApplicationRecord
  belongs_to :pattern
  validates_presence_of :pattern_id
end
