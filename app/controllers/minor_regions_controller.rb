class MinorRegionsController < ApplicationController
  before_action :set_minor_region, only: [:show, :edit, :update, :destroy]
  before_filter :verify_user

  # GET /minor_regions
  # GET /minor_regions.json
  def index
    @minor_regions = MinorRegion.all
  end

  # GET /minor_regions/1
  # GET /minor_regions/1.json
  def show
  end

  # GET /minor_regions/new
  def new
    @minor_region = MinorRegion.new
  end

  # GET /minor_regions/1/edit
  def edit
  end

  # POST /minor_regions
  # POST /minor_regions.json
  def create
    @minor_region = MinorRegion.new(minor_region_params)

    respond_to do |format|
      if @minor_region.save
        format.html { redirect_to @minor_region, notice: 'Minor region was successfully created.' }
        format.json { render :show, status: :created, location: @minor_region }
      else
        format.html { render :new }
        format.json { render json: @minor_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /minor_regions/1
  # PATCH/PUT /minor_regions/1.json
  def update
    respond_to do |format|
      if @minor_region.update(minor_region_params)
        format.html { redirect_to @minor_region, notice: 'Minor region was successfully updated.' }
        format.json { render :show, status: :ok, location: @minor_region }
      else
        format.html { render :edit }
        format.json { render json: @minor_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minor_regions/1
  # DELETE /minor_regions/1.json
  def destroy
    @minor_region.destroy
    respond_to do |format|
      format.html { redirect_to minor_regions_url, notice: 'Minor region was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_minor_region
      @minor_region = MinorRegion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def minor_region_params
      params.require(:minor_region).permit(:minor_id, :description)
    end

    def verify_user 
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless user_signed_in?)
    end
end
