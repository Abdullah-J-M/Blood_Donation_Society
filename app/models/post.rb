# Model for Post
class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, :bloodtype, :requester, :telephone, presence: true
end
