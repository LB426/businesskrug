class CatalogsController < ApplicationController
  before_filter :mark
  before_action :authorize
  before_action :set_catalog, only: [:show, :edit, :update, :destroy]

  # GET /catalogs
  # GET /catalogs.json
  def index
    @catalogs = current_user.catalogs.all
  end

  # GET /catalogs/1
  # GET /catalogs/1.json
  def show
  end

  # GET /catalogs/new
  def new
    @catalogs = current_user.catalogs
    if @catalogs.size > 0
      @catalogs.each do |catalog|
        if catalog.name.nil? || catalog.name.empty?
          flash[:alert] = "У Вас есть незавершённые каталоги.<br>Чтобы создать новый завершите их создание или удалите.<br>Незавершенным считается каталог который имеет ходя бы одно незаполненное поле описания, не имеет загруженных изображений или место на карте не указано."
          redirect_to catalogs_path
          break
        end
        if catalog.locality.nil? || catalog.locality.empty?
          flash[:alert] = "У Вас есть незавершённые каталоги.<br>Чтобы создать новый завершите их создание или удалите.<br>Незавершенным считается каталог который имеет ходя бы одно незаполненное поле описания, не имеет загруженных изображений или место на карте не указано."
          redirect_to catalogs_path
          break
        end
        if catalog.addr.nil? || catalog.addr.empty?
          flash[:alert] = "У Вас есть незавершённые каталоги.<br>Чтобы создать новый завершите их создание или удалите.<br>Незавершенным считается каталог который имеет ходя бы одно незаполненное поле описания, не имеет загруженных изображений или место на карте не указано."
          redirect_to catalogs_path
          break
        end
        if catalog.phone.nil? || catalog.phone.empty?
          flash[:alert] = "У Вас есть незавершённые каталоги.<br>Чтобы создать новый завершите их создание или удалите.<br>Незавершенным считается каталог который имеет ходя бы одно незаполненное поле описания, не имеет загруженных изображений или место на карте не указано."
          redirect_to catalogs_path
          break
        end
        if catalog.email.nil? || catalog.email.empty?
          flash[:alert] = "У Вас есть незавершённые каталоги.<br>Чтобы создать новый завершите их создание или удалите.<br>Незавершенным считается каталог который имеет ходя бы одно незаполненное поле описания, не имеет загруженных изображений или место на карте не указано."
          redirect_to catalogs_path
          break
        end
        if catalog.description.nil? || catalog.description.empty?
          flash[:alert] = "У Вас есть незавершённые каталоги.<br>Чтобы создать новый завершите их создание или удалите.<br>Незавершенным считается каталог который имеет ходя бы одно незаполненное поле описания, не имеет загруженных изображений или место на карте не указано."
          redirect_to catalogs_path
          break
        end
        if catalog.biztype.nil? || catalog.biztype.empty?
          flash[:alert] = "У Вас есть незавершённые каталоги.<br>Чтобы создать новый завершите их создание или удалите.<br>Незавершенным считается каталог который имеет ходя бы одно незаполненное поле описания, не имеет загруженных изображений или место на карте не указано."
          redirect_to catalogs_path
          break
        end
      end
    else
      @catalog = current_user.catalogs.new
      @catalog.save
    end
  end

  # GET /catalogs/1/edit
  def edit
  end

  # POST /catalogs
  # POST /catalogs.json
  def create
    # @catalog = current_user.catalogs.new(catalog_params)

    #respond_to do |format|
    #  if @catalog.save
    #    format.html { redirect_to @catalog, notice: 'Catalog was successfully created.' }
    #  else
    #    format.html { render :new }
    #  end
    #end
  end

  # PATCH/PUT /catalogs/1
  # PATCH/PUT /catalogs/1.json
  def update
    unless params[:publicate].nil?
      ss = params[:sec_and_sub_sec]
      unless ss.nil?
        ss.each do |section,value|
          value.each_key do |subsection|
            logger.debug "sec=#{section} subsec=#{subsection}"
            #res = @catalog.catalog_section_and_sub_section_links.find_by_section_id_and_sub_section_id(section, sub_section)
            #if res == nil
            #  cat_sec_and_sub_sec_link = @catalog.catalog_section_and_sub_section_links.new
            #  cat_sec_and_sub_sec_link.section_id = section
            #  cat_sec_and_sub_sec_link.sub_section_id = sub_section
            #  cat_sec_and_sub_sec_link.save
            #end
          end
        end
      end
      respond_to do |format|
        if @catalog.update(catalog_params)
          format.html { redirect_to @catalog, notice: 'Catalog was successfully updated.' }
          format.json { render :show, status: :ok, location: @catalog }
        else
          format.html { render :edit }
          format.json { render json: @catalog.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /catalogs/1
  # DELETE /catalogs/1.json
  def destroy
    @catalog = current_user.catalogs.find_by_id(params[:id])
    @catalog.destroy
    respond_to do |format|
      format.html { redirect_to catalogs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalog
      @catalog = Catalog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catalog_params
      params.require(:catalog).permit(:name, :locality, :addr, :phone, :email, :siteurl, :description, :biztype)
    end

end
