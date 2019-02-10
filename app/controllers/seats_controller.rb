class SeatsController < ApplicationController
  before_action :set_seat, only: [:show, :edit, :update, :destroy]

  # GET /seats
  # GET /seats.json
  def index
    @booking = Booking.where(:pnr => params[:pnr])
    puts @booking
    puts 'aaaaaaaaaaaaaaaaaaa'
    if (@booking.first.economy_id == nil && @booking.first.first_id == nil)
       @seats = Seat.where(business_id:params[:business_id])
    elsif (@booking.first.business_id == nil && @booking.first.first_id == nil)
       puts params[:economy_id]
       @seats = Seat.where(:economy_id =>params[:economy_id])
     elsif (@booking.first.business_id == nil && @booking.first.economy_id == nil)
        @x = @booking.first.first_id
        @seats = Seat.where(:first_id =>params[:first_id])
    end
  end

  # GET /seats/1
  # GET /seats/1.json
  def show
    if @first
      @first = first.find(params[:first_id])
      @fseat = @first.seats.find(params[:id])
  end
    if @business
      @business = business.find(params[:business_id])
      @bseat = @first.seats.find(params[:id])
  end
    if @economy
      @economy = economy.find(params[:economy_id])
      @eseat = @first.seats.find(params[:id])
  end

  end

  # GET /seats/new
  def new
    @seat = Seat.new
  end

  # GET /seats/1/edit
  def edit
  end

  # POST /seats
  # POST /seats.json
  def create


    respond_to do |format|
      if @seat.save
        format.html { redirect_to flights_path(@flight), notice: 'Seat was successfully created.' }
        format.json { render :show, status: :created, location: @seat }
      else
        format.html { render :new }
        format.json { render json: @seat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seats/1
  # PATCH/PUT /seats/1.json
  def update
    respond_to do |format|
      if @seat.update(seat_params)
        format.html { redirect_to @seat, notice: 'Seat was successfully updated.' }
        format.json { render :show, status: :ok, location: @seat }
      else
        format.html { render :edit }
        format.json { render json: @seat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seats/1
  # DELETE /seats/1.json
  def destroy
    @seat.destroy
    respond_to do |format|
      format.html { redirect_to seats_url, notice: 'Seat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seat
      @seat = Seat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seat_params
      params.require(:seat).permit(:class_id, :first_id, :spnr, :class_pnr, :seatno)
    end
end
