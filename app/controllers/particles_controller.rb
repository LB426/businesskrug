class ParticlesController < ApplicationController
  before_filter :mark
  before_action :authorize
  before_action :set_catalog, only: [:new, :create, :update, :edit]
  before_action :set_particle, only: [:update, :edit]

  def new
    @particle = @catalog.particles.new
  end

  def edit
  end

  def create
    @particle = @catalog.particles.new(particle_params)
    if @particle.save
      flash[:notice] = "Страница каталога создана успешно."
      redirect_to catalog_path(@catalog)
    else
      flash[:error] = "Страницу каталога создать не удалось!"
      render :new
    end
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
      params.require(:particle).permit(:name, items_attributes: [:name, :spec, :picture] )
    end
end
