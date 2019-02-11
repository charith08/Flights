class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  #before_action :is_admin?, only: [:new, :edit, :create, :update, :destroy]
  include SessionsHelper
  # GET /flights
  # GET /flights.json
  def index
    @flights = Flight.all
  end

  def findflight
    @flights = Flight.where(:from => params[:from].downcase, :destination => params[:destination].downcase)
    if (@flights.nil?)
    else
      flash[:info] = "Sorry no flights to that route yet"
      redirect_to root_path
    end
  end


  # GET /flights/1
  # GET /flights/1.json
  def show
    @flights = Flight.all
    @first = @flight.first
    @business = @flight.business
    @economy = @flight.economy
    if @first
      @fseat = @first.seats
    end
    if @business
      @bseat = @business.seats
    end
    if @economy
      @eseat = @economy.seats
    end
  end

  # GET /flights/new
  def new
    if is_admin?
    @flight = Flight.new
  else
    redirect_to root_path
  end
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights
  # POST /flights.json
  def create
    if is_admin?
    @flight = Flight.new(flight_params)
    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: 'Flight was successfully created.' }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  else
    redirect_to root_path
  end
  end

  # PATCH/PUT /flights/1
  # PATCH/PUT /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to @flight, notice: 'Flight was successfully updated.' }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1
  # DELETE /flights/1.json
  def destroy
    if is_admin?
    @flight.destroy
    respond_to do |format|
      format.html { redirect_to flights_url, notice: 'Flight was successfully destroyed.' }
      format.json { head :no_content }
    end
  else
    redirect_to root_path
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flight_params
      params.require(:flight).permit(:name, :ftype, :from, :destination, :start_time, :end_time, :base_price)
    end


end
