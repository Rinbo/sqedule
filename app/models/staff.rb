class Staff < ApplicationRecord
  validates_presence_of :name, :user_id
  validates :name, uniqueness: true
  belongs_to :user
  has_many :assignments, dependent: :destroy
end