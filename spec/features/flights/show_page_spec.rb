require "rails_helper"

RSpec.describe "Flight Show Page Spec" do
  before :each do
    @frontier = Airline.create(name: "Frontier")

    @flight_1727 = Flight.create(number: "1727",
                  date: "08/03/20",
                  time: "8:00 AM",
                  departure_city: "Denver",
                  arrival_city: "Reno",
                  airline_id: @frontier.id)

    @joe = Passenger.create(name: "Joe", age: 7)
    @jackie = Passenger.create(name: "Jackie", age: 17)
    @jill = Passenger.create(name: "Jill", age: 21)
    @jamie = Passenger.create(name: "Jamie", age: 28)

    @passengers = [@joe, @jackie, @jill, @jamie]

    @flight_1727.passengers << @passengers

    visit "/flights/#{@flight_1727.id}"
  end

  describe "As a visitor to a flights show page" do
    describe "I see all of that flights information" do
      it "number, date, time, departure and arrival cities" do
        within ".flight-information" do
          expect(page).to have_content(@flight_1727.number)
          expect(page).to have_content(@flight_1727.date)
          expect(page).to have_content(@flight_1727.time)
          expect(page).to have_content(@flight_1727.departure_city)
          expect(page).to have_content(@flight_1727.arrival_city)
        end
      end
      it "name of the airline this flight belongs" do
        within ".airline-name" do
          expect(page).to have_content(@frontier.name)
        end
      end
      it "the names of all of the passengers on this flight" do
        within ".passenger-names" do
          @passengers.each do |passenger|
            expect(page).to have_content(passenger.name)
          end
        end
      end
    end
  end
end
