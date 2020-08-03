require "rails_helper"

RSpec.describe Flight do
  describe "associations" do
    it { should belong_to :airline }
    it { should have_many :flight_passengers }
    it { should have_many(:passengers).through(:flight_passengers) }
  end

  describe "class methods" do
    it ".get_flight_id_from_flight_number" do
      airline = Airline.create(name: "Frontier")

      flight = Flight.create(number: "1727",
                             date: "08/03/20",
                             time: "8:00 AM",
                             departure_city: "Denver",
                             arrival_city: "Reno",
                             airline_id: airline.id)

      expect(Flight.get_flight_id_from_flight_number(flight.number)).to eq(flight.id)
    end
  end
end
