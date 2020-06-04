class Retro < ApplicationRecord
  belongs_to :team
  has_many :outcomes, dependent: :destroy
  has_many :answers, dependent: :destroy
end
