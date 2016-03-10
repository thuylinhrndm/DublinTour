require 'tours'
require 'tour_logger'

class ToursController < ApplicationController
  #before_action :set_tour, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user! 
  before_filter :ensure_admin, :only => [:edit, :destroy]


  def ensure_admin
    unless current_user && current_user.admin?
      render :text => "Access Error Message", :status => :unauthorized
    end
  end


  # GET /tours
  # GET /tours.json
  def index
    @tours = Tour.all
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
  end

  # GET /tours/new
  def new
    @tour = Tour.new
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours
  # POST /tours.json
  def create
    @tour = Tour.new()
    @tour.tourtype = params[:tour][:tourtype]
    @tour.day = Date.new(params[:tour]["day(1i)"].to_i,params[:tour]["day(2i)"].to_i,params[:tour]["day(3i)"].to_i)
    @tour.time = params[:tour][:time]
    
      # create an instance/object of a BasicTour
      mytour = BasicTour.new(@tour.tourtype, @tour.day, @tour.time)
    
    # add the extra features to the new tour
    if params[:tour][:audio].to_s.length > 0 then
        mytour = AudioGuide.new(mytour)
    end
    
    # add the extra features to the new car
    if params[:tour][:interest].to_s.length > 0 then
        mytour = TicketInterestPlace.new(mytour)
    end
    
    ## populate the cost and the description details
   @tour.cost = mytour.cost
   @tour.description = mytour.details
  
    
     # retrieve the instance/object of the TourLogger class
    logger = TourLogger.instance
    logger.logInformation("A new tour added: " + @tour.description)
    

    respond_to do |format|
      if @tour.save
        format.html { redirect_to @tour, notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_params
      params.require(:tour).permit(:tourtype, :day, :time)
    end
end
