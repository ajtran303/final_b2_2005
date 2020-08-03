class FlightPassengersController < ApplicationController
  def create
    flight_id = Flight.get_flight_id_from_flight_number(params[:flight_number])
    passenger_id = params[:passenger_id]
    
    FlightPassenger.create(passenger_id: passenger_id, flight_id: flight_id)
    redirect_to passengers_path(passenger_id)
  end
end
