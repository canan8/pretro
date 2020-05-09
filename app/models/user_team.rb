class UserTeam < ApplicationRecord
  validates :user_id, presence: true
  validates :team_id, presence: true
end
