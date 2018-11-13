class Assignment < ApplicationRecord
  belongs_to :staff
  validates_presence_of :staff_id
end