class Pattern < ApplicationRecord
  has_many :shifts, dependent: :destroy
  belongs_to :user
  validates_presence_of :user_id
end
