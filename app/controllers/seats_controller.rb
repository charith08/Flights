class SeatsController < ApplicationController
  before_action :set_seat, only: [:show, :edit, :update, :destroy]

  # GET /seats
  # GET /seats.json
  def index
    @seats = Seat.all
  end

  # GET /seats/1
  # GET /seats/1.json
  def show
    @first = first.find(params[:first_id])
    @seat = @first.seats.find(params[:id])

  end

  # GET /seats/new
  def new
    if @first
     @first = First.find(params[:first_id])
    end
    if @business
    @business = Business.find(params[:business_id])
    end
    if @economy
      @economy = Economy.find(params[:economy_id])
    end
    @seat = Seat.new
  end

  # GET /seats/1/edit
  def edit
  end

  # POST /seats
  # POST /seats.json
  def create
    if @first
    @first = First.find(params[:first_id])
    @first.row.times do |i|
      @first.seats_in_row.times do |i|
        @seat = @first.seats.create(seat_params)
      end
     end
    end

    if @business
    @business = Business.find(params[:business_id])

     @business.row.times do |i|
       @business.seats_in_row.times do |i|
         @seat = @business.seats.create(seat_params)
       end
      end
    end

    if @economy
     @economy = Economy.find(params[:economy_id])

      @economy.row.times do |i|
        @economy.seats_in_row.times do |i|
         @seat =  @economy.seats.create(seat_params)
       end
      end
    end

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
      params.require(:seat).permit(:class_id, :first_id, :spnr, :class_pnr)
    end
end
