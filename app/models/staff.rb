class Staff < ApplicationRecord
  validates_presence_of :name, :user_id
  belongs_to :user
  has_many :assignments
end