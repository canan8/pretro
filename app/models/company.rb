class Company < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  has_many :users
  has_many :teams
end
