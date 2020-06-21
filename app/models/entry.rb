class Entry < ApplicationRecord
  belongs_to :answer
  validates :detail, presence: true, length: { minimum: 2, maximum: 255 }
end
