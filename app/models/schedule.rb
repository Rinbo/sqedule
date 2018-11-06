class Schedule < ApplicationRecord
  belongs_to :user
  has_many :patterns
  validates_presence_of :user_id, :period
end
