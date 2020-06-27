class Answer < ApplicationRecord
  # attr_accessor :entries_attributes
  belongs_to :user
  belongs_to :retro
  has_many :entries, dependent: :destroy
  accepts_nested_attributes_for :entries, allow_destroy: true

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
