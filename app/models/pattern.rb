class Pattern < ApplicationRecord
  has_many :shifts
  #belongs_to :user
  #validates_presence_of :user_id
end
