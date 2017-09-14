# users
class User < ApplicationRecord
  has_many :leaders, class_name: 'Subscription',
                     foreign_key: :follower_id,
                     dependent: :destroy
  has_many :followers, class_name: 'Subscription',
                       foreign_key: :leader_id,
                       dependent: :destroy

  def following?(leader)
    leaders.include? leader
  end

  def follow!(leader)
    return if leader == self || following?(leader)
    leaders << leader
  end
end
