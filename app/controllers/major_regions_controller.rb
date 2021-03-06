class MajorRegionsController < ApplicationController
  before_action :set_major_region, only: [:show, :edit, :update, :destroy]
  before_filter :verify_user
  # GET /major_regions
  # GET /major_regions.json
  def index
    @major_regions = MajorRegion.all
  end

  # GET /major_regions/1
  # GET /major_regions/1.json
  def show
  end

  # GET /major_regions/new
  def new
    @major_region = MajorRegion.new
  end

  # GET /major_regions/1/edit
  def edit
    if @major_region.user_id != current_user.id
      redirect_to(root_path)
    end 
  end

  # POST /major_regions
  # POST /major_regions.json
  def create
    @major_region = MajorRegion.new(major_region_params)
    @major_region.user_id = current_user.id

    respond_to do |format|
      if @major_region.save
        format.html { redirect_to @major_region, notice: 'Major region was successfully created.' }
        format.json { render :show, status: :created, location: @major_region }
      else
        format.html { render :new }
        format.json { render json: @major_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /major_regions/1
  # PATCH/PUT /major_regions/1.json
  def update
    if @major_region.user_id != current_user.id
      redirect_to(root_path)
    else 
      respond_to do |format|
        if @major_region.update(major_region_params)
          format.html { redirect_to @major_region, notice: 'Major region was successfully updated.' }
          format.json { render :show, status: :ok, location: @major_region }
        else
          format.html { render :edit }
          format.json { render json: @major_region.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /major_regions/1
  # DELETE /major_regions/1.json
  def destroy
    if @major_region.user_id != current_user.id
      redirect_to(root_path)
    else 
      @major_region.destroy
      respond_to do |format|
        format.html { redirect_to major_regions_url, notice: 'Major region was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_major_region
      @major_region = MajorRegion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def major_region_params
      params.require(:major_region).permit(:major_id, :description)
    end

    def verify_user 
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless user_signed_in?)
    end
end
