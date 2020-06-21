class Retro < ApplicationRecord
  # date and time validation
  belongs_to :team
  has_many :outcomes, dependent: :destroy
  has_many :answers, dependent: :destroy

  def active?
    status == 'active'
  end

end
