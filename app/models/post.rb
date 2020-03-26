# Model for Post
class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, :bloodtype, :requester, :telephone, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :volunteers, dependent: :destroy
end
