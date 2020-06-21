class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :retro
  has_many :entries, dependent: :destroy
end
