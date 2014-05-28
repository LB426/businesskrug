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
        @catalog = current_user.catalogs.new
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
        ss_array = []
        ss.each do |section,value|
          value.each_key do |subsection|
            ss_hash = {'sec' => section, 'subsec' => subsection }
            ss_array << ss_hash
          end
        end
        @catalog.sss = ss_array
      end
      test = ""
      phone = params[:catalog][:phone]
      unless phone.nil?
        unless phone =~ /^\d{10}$/
          test = test + '<br>phone: неверный формат, пример - 9619221133, без +7 или 8 впереди номера'
        end
      end
      email = params[:catalog][:email]
      unless email.nil?
        unless email =~ /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
          test = test + '<br>email: неверный формат, пример - andrey@mymail.ru'
        end
      end
      respond_to do |format|
        if @catalog.update(catalog_params)
          format.html { redirect_to @catalog, notice: "Каталог успешно обновлён. #{test}" }
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
      params.require(:catalog).permit(:name, :locality, :addr, :phone, :email, :siteurl, :description, :biztype, 
                                      catalogimgs_attributes: [:picture, :id] )
    end

end
