class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :retro
  has_many :entries, dependent: :destroy

  def positive_entries
    self.entries.select { |entry| entry.positive? }
  end 

  def neutral_entries
    self.entries.select { |entry| entry.neutral? }
  end

  def negative_entries
    self.entries.select { |entry| entry.negative? }
  end
end
