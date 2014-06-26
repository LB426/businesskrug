class ParticlesController < ApplicationController
  before_filter :mark
  before_action :authorize
  before_action :set_catalog, only: [:new, :create, :update, :edit, :show, :destroy]
  before_action :set_particle, only: [:update, :edit, :show, :destroy]

  def new
    @particle = @catalog.particles.new
    if @particle.save
      @item = @particle.items.new
      @item.save
      @itemimg = @item.itemimgs.new
      @itemimg.save
      redirect_to edit_catalog_particle_path(@catalog, @particle)
    else
      flash[:error] = "Страницу каталога создать не удалось!"
      redirect_to catalog_path(@catalog)
    end
  end

  def edit
  end

  def update
    if @particle.update(particle_params)
      flash[:notice] = "Страница каталога создана успешно."
      redirect_to catalog_path(@catalog)
    else
      flash[:error] = "Страницу каталога создать не удалось!"
      render :new
    end
  end

  def show

  end

  def destroy
    if @particle.destroy
      flash[:notice] = "Страница каталога удалена"
      redirect_to catalog_path(@catalog)
    else
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalog
      @catalog = Catalog.find(params[:catalog_id])
    end

    def set_particle
      @particle = Particle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def particle_params
      params.require(:particle).permit( :id, :name, items_attributes: [:id, :name, :spec, itemimgs_attributes: [:id, :picture]] )
    end
end
