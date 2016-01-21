class HomeController < ApplicationController
  def index
  	@meeting = Meeting.new
  end
end
