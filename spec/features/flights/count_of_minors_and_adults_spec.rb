require "rails_helper"

RSpec.describe "Count of Minors and Adults on Flight Show Page Spec" do
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
    @jenny = Passenger.create(name: "Jackie", age: 18)
    @jill = Passenger.create(name: "Jill", age: 21)
    @jamie = Passenger.create(name: "Jamie", age: 28)

    @passengers = [@joe, @jackie, @jenny, @jill, @jamie]

    @flight_1727.passengers << @passengers

    visit flights_path(@flight_1727)
  end

  describe "As a visitor to a flights show page" do
    describe "I see a breakdown of passenger ages on that flight" do
      it "I see the number of minors on the flight (under 18)" do
        within(".passenger-ages") do
          expect(page).to have_content("Minors: 2")
        end
      end

      it "I see the number of adults on the flight (18 and over)" do
        within(".passenger-ages") do
          expect(page).to have_content("Adults: 3")
        end
      end
    end
  end
end
