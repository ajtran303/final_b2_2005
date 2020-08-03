class WelcomeController < ApplicationController
  def index
    @all_flights_and_passengers = {flights: Flight.all, passengers: Passenger.all}
  end
end
