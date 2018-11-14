class Pattern < ApplicationRecord
  has_many :shifts, dependent: :destroy
  belongs_to :user
  validates_presence_of :user_id, :shift_start, :shift_end, :break_length
end
