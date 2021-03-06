class BeaconsController < ApplicationController
  before_action :set_beacon, only: [:show, :edit, :update, :destroy]
  before_filter :verify_user, only: [:new,:edit,:create,:update,:destroy]

  # GET /beacons
  # GET /beacons.json
  def index
    @beacons = Beacon.all
  end

  # GET /beacons/1
  # GET /beacons/1.json
  def show
  end

  #GET /beacons/showregion?major_region_id=&minor_region_id=
  #GET /beacons/showregion?major_region_id=&minor_region_id=.json
  def showregion
      @beacon = Beacon.where(major_region_id:params[:major_region_id],minor_region_id:params[:minor_region_id]).first
  end

  # GET /beacons/new
  def new
    @beacon = Beacon.new
  end

  # GET /beacons/1/edit
  def edit
    if @beacon.user_id != current_user.id
      redirect_to(root_path)
    end        
  end

  # POST /beacons
  # POST /beacons.json
  def create
    @beacon = Beacon.new(beacon_params)
    @beacon.user_id = current_user.id

    respond_to do |format|
      if @beacon.save
        format.html { redirect_to @beacon, notice: 'Beacon was successfully created.' }
        format.json { render :show, status: :created, location: @beacon }
      else
        format.html { render :new }
        format.json { render json: @beacon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beacons/1
  # PATCH/PUT /beacons/1.json
  def update
    if @beacon.user_id != current_user.id
      redirect_to(root_path)
    else 
      respond_to do |format|
        if @beacon.update(beacon_params)
          format.html { redirect_to @beacon, notice: 'Beacon was successfully updated.' }
          format.json { render :show, status: :ok, location: @beacon }
        else
          format.html { render :edit }
          format.json { render json: @beacon.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /beacons/1
  # DELETE /beacons/1.json
  def destroy
    if @beacon.user_id != current_user.id
      redirect_to(root_path)
    else 
      @beacon.destroy
      respond_to do |format|
        format.html { redirect_to beacons_url, notice: 'Beacon was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beacon
      @beacon = Beacon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beacon_params
      params.require(:beacon).permit(:name,:major_region_id,:minor_region_id,:description)
    end

    #Filtro de logueo, si no esta logueado redirige a pagina inicial
    def verify_user 
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless user_signed_in?)
    end
end
