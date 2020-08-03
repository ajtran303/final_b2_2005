class FlightPassengersController < ApplicationController
  def create
    if can_add_passenger?(passenger.id, flight.id)
      FlightPassenger.create(passenger_id: passenger.id, flight_id: flight.id)
    else
      flash[:notice] = "#{passenger.name} is already on Flight #{flight.number}."
    end
    redirect_to passengers_path(passenger)
  end

  private

  def can_add_passenger?(passenger_id, flight_id)
    flight_passenger = FlightPassenger.where(passenger_id: passenger_id, flight_id: flight_id)
    flight_passenger.empty?
  end

  def passenger
    @passenger ||= Passenger.find(params[:passenger_id])
  end

  def flight
    flight_id = Flight.get_flight_id_from_flight_number(params[:flight_number])
    @flight ||= Flight.find(flight_id)
  end
end
