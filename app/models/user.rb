# users
class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :leaders, class_name: 'Subscription',
                     foreign_key: :follower_id,
                     dependent: :destroy
  has_many :followers, class_name: 'Subscription',
                       foreign_key: :leader_id,
                       dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :text_posts, dependent: :destroy
  has_many :image_posts, dependent: :destroy
  has_many :comments

  def following?(leader)
    leaders.include? leader
  end

  def follow!(leader)
    return if leader == self || following?(leader)
    leaders << leader
  end
end
