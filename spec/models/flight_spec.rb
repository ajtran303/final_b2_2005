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

  describe "instance methods" do
    before :each do
      frontier = Airline.create(name: "Frontier")

      @flight = Flight.create(number: "1727",
                             date: "08/03/20",
                             time: "8:00 AM",
                             departure_city: "Denver",
                             arrival_city: "Reno",
                             airline_id: frontier.id)

      joe = Passenger.create(name: "Joe", age: 7)
      jackie = Passenger.create(name: "Jackie", age: 17)
      jenny = Passenger.create(name: "Jackie", age: 18)
      jill = Passenger.create(name: "Jill", age: 21)
      jamie = Passenger.create(name: "Jamie", age: 28)

      passengers = [joe, jackie, jenny, jill, jamie]

      @flight.passengers << passengers
    end

    it "#count_minor_passengers" do
      expect(@flight.count_minor_passengers).to eq(2)
    end

    it "#count_adult_passengers" do
      expect(@flight.count_adult_passengers).to eq(3)
    end
  end
end
