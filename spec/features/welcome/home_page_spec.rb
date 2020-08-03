require "rails_helper"

RSpec.describe "Home Page Spec" do
  before :each do
    frontier = Airline.create(name: "Frontier")
    southwest = Airline.create(name: "Southwest")

    @flight1 = Flight.create(number: "1727",
                  date: "08/03/20",
                  time: "8:00 AM",
                  departure_city: "Denver",
                  arrival_city: "Reno",
                  airline_id: frontier.id)

    @flight2 = Flight.create(number: "2465",
                  date: "08/03/20",
                  time: "8:00 AM",
                  departure_city: "Denver",
                  arrival_city: "Reno",
                  airline_id: frontier.id)

    @flight3 = Flight.create(number: "2255",
                  date: "08/03/20",
                  time: "8:00 AM",
                  departure_city: "Denver",
                  arrival_city: "Reno",
                  airline_id: southwest.id)

    @joe = Passenger.create(name: "Joe", age: 7)
    @jackie = Passenger.create(name: "Jackie", age: 17)
    @jenny = Passenger.create(name: "Jackie", age: 18)
    @jill = Passenger.create(name: "Jill", age: 21)
    @jamie = Passenger.create(name: "Jamie", age: 28)

    @flight1.passengers << [@joe, @jill]
    @flight2.passengers << [@jackie, @jenny]
    @flight3.passengers << [@joe, @jackie, @jenny, @jill, @jamie]

    @passengers = [@joe, @jackie, @jenny, @jill, @jamie]
    @flights = [@flight1, @flight2, @flight3]

    visit "/"
  end

  describe "As a visitor to the homepage" do
    describe "I see a list of hyper-links" do
      it "to each flight show page" do
        within ".all-flights" do
          @flights.each do |flight|
            expect(page).to have_link("Flight #{flight.number}", href: flights_path(flight))
          end
        end
      end
      it "to each passenger show page" do
        within ".all-passengers" do
          @passengers.each do |passenger|
            expect(page).to have_link("#{passenger.name}", href: passengers_path(passenger))
          end
        end
      end
    end
  end
end
