class Profile < ActiveRecord::Base
  belongs_to :user

  extend FriendlyId
  friendly_id :full_name, use: :slugged

  mount_uploader :image, ProfileImageUploader

  def full_name
  	[user.first_name, user.last_name].compact.join(' ')
  end
end
