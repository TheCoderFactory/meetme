class User < ActiveRecord::Base
	has_one :profile
	has_many :attendees
	has_many :meetings, through: :attendees
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
