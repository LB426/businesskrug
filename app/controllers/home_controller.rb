class HomeController < ApplicationController
  before_filter :mark
  before_filter :authenticated_user?

  def index
  end

end
