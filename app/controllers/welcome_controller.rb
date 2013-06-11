class WelcomeController < ApplicationController
  def index
    if current_user
      flash[:alert] = flash[:alert] if flash[:alert]
      flash[:notice] = flash[:notice] if flash[:notice]
      redirect_to '/dashboard' if current_user.admin?
      redirect_to '/students'  if current_user.teacher? || current_user.warden? 
    end
  end
end
