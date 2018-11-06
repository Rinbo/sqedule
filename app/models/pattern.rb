class Pattern < ApplicationRecord
  belongs_to :schedule
  has_many :shifts
  validates_presence_of :schedule_id
end
