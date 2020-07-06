class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :retro
  has_many :entries, dependent: :destroy

  def positive_entries
    positive_entries = []
    self.entries.each do |entry|
      positive_entries.push(entry) if entry.positive?
    end
    positive_entries
  end 

  def neutral_entries
    neutral_entries = []
    self.entries.each do |entry|
      neutral_entries.push(entry) if entry.neutral?
    end
    neutral_entries
  end

  def negative_entries
    negative_entries = []
    self.entries.each do |entry|
      negative_entries.push(entry) if entry.negative?
    end
    negative_entries
  end
end
