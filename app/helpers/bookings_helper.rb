module BookingsHelper
  def get_flight_name(id)
    Flight.find(id).name
   end

   def get_flight_lname(id)
     Flight.find(id).ftype
    end


end
