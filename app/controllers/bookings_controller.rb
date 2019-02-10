class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]
  before_action :logged_in_user
  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.where(:user_id=>current_user.id )
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @seats= Seat.where(:booking_id => @booking.id)

    if (!@booking.business_id.nil? )
       @business = Business.where(id: @booking.business_id).first
    elsif (!@booking.economy_id.nil? )

          @economy = Economy.where(id: @booking.economy_id).first
    elsif (!@booking.first_id.nil? )

             @first = First.where(id: @booking.first_id).first
    end
  end

  def userbooking
    @bookings = Booking.where(:user_id=>current_user.id )
  end


   def bookseat
     @pnr = params[:pnr]
     @booking = Booking.where(:pnr => params[:pnr]).last
     if (@booking.booked == true)
       flash[:info] = "Seats are already booked"
       redirect_back(fallback_location: root_path)
     else
         @booking.selectseats.destroy_all
         if (!@booking.business_id.nil? )
            @seats = Seat.where(business_id: @booking.business_id).order("id")
            @business = Business.where(flight_id: @booking.flight_id).first
         elsif (!@booking.economy_id.nil? )
               @seats = Seat.where(economy_id: @booking.economy_id).order("id")
               @economy = Economy.where(flight_id: @booking.flight_id).first
         elsif (!@booking.first_id.nil? )
                  @seats = Seat.where(first_id: @booking.first_id).order("id")
                  @first = First.where(flight_id: @booking.flight_id).first
         end
      end

   end


   def seatselect
     @booking = Booking.find(params[:booking_id])
     @seat = Seat.find(params[:seat_id])
    if (!@booking.selectseats.where(:seatnumber => params[:seat_id]).exists?)
      @booking.selectseats.create(:seatnumber => params[:seat_id], :booking_id => @booking.id)
    else
      @x = Selectseat.where(:seatnumber => params[:seat_id])
      @x.destroy_all
    end

   end

   def confirm
     @booking = Booking.find(params[:booking_id])
     @booking.update_column(:booked, true)
     @seats = Seat.where(:seat_id => params[:id])
     puts 'aaaaaaaaaaaa14522222aa'
     flash[:success]="Booking has been successful"
      @booking.selectseats.each do |i|
        @selectedseat = Seat.find(i.seatnumber)
        puts @selectedseat.id
        @selectedseat.update_attributes(:booking_id => @booking.id, :available => false)
      end

     redirect_to bookings_path
   end

  # GET /bookings/new
  def new
    @flight = Flight.find(params[:flight_id])
    @first = @flight.first
    @business = @flight.business
    @economy = @flight.economy
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.create(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:economy_id, :business_id, :first_id, :flight_id, :name, :email, :pnr, :seats, :user_id, :classname, :search, :booked)
    end
end
