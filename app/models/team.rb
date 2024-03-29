class Team < ApplicationRecord
  validates :name, presence: true
  validates :company_id, presence: true

  belongs_to :company
  has_many :user_teams, dependent: :destroy
  has_many :users, through: :user_teams
  has_many :retros
end
