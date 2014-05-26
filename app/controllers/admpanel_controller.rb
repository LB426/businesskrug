class AdmpanelController < ApplicationController
  before_filter :mark
  before_action :checkadmin

  def index
  end

  private
  
  def checkadmin
    unless current_user.group.include? 'admin'
      flash[:alert] = "For use this option - authorize as administrator!"
      redirect_to login_path
    end
  end

end
