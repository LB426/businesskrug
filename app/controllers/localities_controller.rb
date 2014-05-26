class LocalitiesController < ApplicationController
  def get_locality
    simvols = params["locality_name_starts_with"]
    locality = Locality.where("name like '#{simvols}%'")
    render :json => locality, :only => [:id, :name]
  end
end
