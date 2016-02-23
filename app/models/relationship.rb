class Relationship < ActiveRecord::Base
	belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end

#  current_user.followers
#  current_user.followed_users
