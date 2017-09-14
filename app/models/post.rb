# The posts
class Post < ApplicationRecord
  belongs_to :user
  has_many   :comments
  validates :user_id, :type, presence: true
end
