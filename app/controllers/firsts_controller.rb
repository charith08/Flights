class FirstsController < ApplicationController
  #before_action :set_first, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  # GET /firsts
  # GET /firsts.json
  def index
    @firsts = First.all
  end

  # GET /firsts/1
  # GET /firsts/1.json
  def show
    @flight = Flight.find(params[:flight_id])
    @first = @flight.first
  end

  # GET /firsts/new
  def new
    @flight = Flight.find(params[:flight_id])
    @first = First.new
  end

  # GET /firsts/1/edit
  def edit
  end

  # POST /firsts
  # POST /firsts.json
  def create
    @flight = Flight.find(params[:flight_id])
    @first = First.create(first_params)
    @flight.first = @first

    @x=1
    @first.row.times do |i|
      @first.seats_in_row.times do |i|
        @seat = @first.seats.create(seatno: @x)
        @x=@x+1
      end
     end
    respond_to do |format|
      if @first.save
        @first.update_attributes(num_of_seats: @first.seats_in_row * @first.row )
        format.html { redirect_to @flight, notice: 'Firstclass is created.' }
        format.json { render :show, status: :created, location: @first }
      else
        format.html { render :new }
        format.json { render json: @first.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /firsts/1
  # PATCH/PUT /firsts/1.json
  def update
    respond_to do |format|
      if @first.update(first_params)
        format.html { redirect_to @first, notice: 'First successfully updated.' }
        format.json { render :show, status: :ok, location: @first }
      else
        format.html { render :edit }
        format.json { render json: @first.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /firsts/1
  # DELETE /firsts/1.json
  def destroy
    @first.destroy
    respond_to do |format|
      format.html { redirect_to firsts_url, notice: 'First was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_first
      #@first = First.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def first_params
      params.require(:first).permit(:row, :seats_in_row, :first_price)
    end
end
