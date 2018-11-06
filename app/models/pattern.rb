class Pattern < ApplicationRecord
  belongs_to :schedule
  validates_presence_of :schedule_id
end
