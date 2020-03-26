class User < ApplicationRecord
  has_many :comments
  has_many :posts

  has_many :volunteers, through: :posts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: %i[normal moderator admin]
  after_initialize do
    self.role ||= :normal if new_record?
  end
end
