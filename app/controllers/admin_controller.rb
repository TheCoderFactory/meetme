class AdminController < ApplicationController
  def index
    unless current_user.has_role? :admin
      redirect_to root_path
    end
  end
end
