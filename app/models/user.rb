# users
class User < ApplicationRecord
  has_many :subscriptions, foreign_key: :follower_id,
                           dependent: :destroy
  has_many :leaders, through: :subscriptions

  def following?(leader)
    leaders.include? leader
  end

  def follow!(leader)
    return if leader == self || following?(leader)
    leaders << leader
  end
end
