class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }

  belongs_to :company, optional: true
  has_many :user_teams, dependent: :destroy
  has_many :teams, through: :user_teams

  def already_present?(resource)
    resource.users.include?(self)
  end
end
