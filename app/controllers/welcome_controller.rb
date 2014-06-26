class WelcomeController < ApplicationController
  before_filter :mark

  def index
    @catalogs = Catalog.all
  end

end
