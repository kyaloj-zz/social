# The posts
class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, :type, presence: true
end
