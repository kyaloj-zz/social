class Comment < ApplicationRecord
  belongs_to :post, touch: true
  belongs_to :user
  validates :body, :post_id, :user_id, presence: true
end
