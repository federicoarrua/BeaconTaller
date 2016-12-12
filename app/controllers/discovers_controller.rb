class DiscoversController < ApplicationController
  before_action :set_discover, only: [:show, :edit, :update, :destroy]
  before_filter :verify_user, only: [:show,:edit,:update,:destroy,:index,:show]

  # GET /discovers
  # GET /discovers.json
  def index
    start_date = params[:index][:start_date].to_date.beginning_of_day
    end_date = params[:index][:end_date].to_date.end_of_day
    
    if start_date > end_date
      flash[:date_discover] = "La fecha inicial debe ser menor a la final"
      redirect_to report_index_url
    else  
      @discovers = Discover.where(:created_at => start_date..end_date)
      
      respond_to do |format|
        format.html
        format.xlsx
        format.json
      end
    end
  end

  # GET /discovers/1
  # GET /discovers/1.json
  def show
  end

  # GET /discovers/new
  def new
    @discover = Discover.new
  end

  # GET /discovers/1/edit
  def edit
  end

  # POST /discovers
  # POST /discovers.json
  def create
    @discover = Discover.new(discover_params)

    respond_to do |format|
      if @discover.save
        format.html { redirect_to @discover, notice: 'Discover was successfully created.' }
        format.json { render :show, status: :created, location: @discover }
      else
        format.html { render :new }
        format.json { render json: @discover.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discovers/1
  # PATCH/PUT /discovers/1.json
  def update
    respond_to do |format|
      if @discover.update(discover_params)
        format.html { redirect_to @discover, notice: 'Discover was successfully updated.' }
        format.json { render :show, status: :ok, location: @discover }
      else
        format.html { render :edit }
        format.json { render json: @discover.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discovers/1
  # DELETE /discovers/1.json
  def destroy
    @discover.destroy
    respond_to do |format|
      format.html { redirect_to discovers_url, notice: 'Discover was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discover
      @discover = Discover.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discover_params
      params.require(:discover).permit(:device_id,:beacon_id,:major_id,:minor_id,:discover_time)
    end

    def verify_user 
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless user_signed_in?)
    end
end
