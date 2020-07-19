class Entry < ApplicationRecord
  # enum type: [:positive, :neutral, :negative]
  belongs_to :answer
  validates :detail, presence: true, length: { minimum: 2, maximum: 255 }

  def positive?
    entry_type == 'positive'
  end

  def neutral?
    entry_type == 'neutral'
  end

  def negative?
    entry_type == 'negative'
  end
end
