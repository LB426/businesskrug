class BiznesstypesController < ApplicationController
  def get_biznesstype
    simvols = params["biznesstype_name_starts_with"]
    biznesstype = Biznesstype.where("name like '#{simvols}%'")
    render :json => biznesstype, :only => [:id, :name]
  end
end
