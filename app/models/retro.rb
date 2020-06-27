class Retro < ApplicationRecord
  # date and time validation
  belongs_to :team
  has_many :outcomes, dependent: :destroy
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

  def active?
    status == 'active'
  end

end
