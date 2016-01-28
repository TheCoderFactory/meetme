class HomeController < ApplicationController
	skip_before_action :authenticate_user!
  def index
  	@meeting = Meeting.new
  	if user_signed_in?
  		@my_meetings = Meeting.in_future.where(organiser_id: current_user.id)
  		@meetings = current_user.meetings.in_future
  	end
  end
end
