class EventsController < ApplicationController
  before_action :is_logged_in
  def new
  end
  
  private
  
  def is_logged_in
    if !current_user
      flash[:msg] = "You must be logged in to acccess that page"
      redirect_to login_path
    end
  end
end
