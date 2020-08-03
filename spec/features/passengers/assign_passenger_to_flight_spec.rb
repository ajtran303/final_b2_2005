require "rails_helper"

RSpec.describe "Assign Passenger To Flight Spec" do
  before :each do
    @frontier = Airline.create(name: "Frontier")

    @flight1 = Flight.create(number: "1727",
                  date: "08/03/20",
                  time: "8:00 AM",
                  departure_city: "Denver",
                  arrival_city: "Reno",
                  airline_id: @frontier.id)

    @flight2 = Flight.create(number: "2465",
                  date: "08/03/20",
                  time: "8:00 AM",
                  departure_city: "Denver",
                  arrival_city: "Reno",
                  airline_id: @frontier.id)

    @flight3 = Flight.create(number: "2255",
                  date: "08/03/20",
                  time: "8:00 AM",
                  departure_city: "Denver",
                  arrival_city: "Reno",
                  airline_id: @frontier.id)

    @passenger1 = Passenger.create(name: "Jill", age: 21)

    @flight1.passengers << @passenger1
    @flight2.passengers << @passenger1
  end

  describe "As a visitor to a passengers show page" do
    it "I can assign a passenger to a flight with a form" do
      visit passengers_path(@passenger1)

      within ".passenger-flights" do
        expect(page).to have_content(@flight1.number)
        expect(page).to have_content(@flight2.number)

        expect(page).to_not have_content(@flight3.number)
      end

      within "#passenger-flight-assignment-form" do
        expect(page).to have_content("Add A Flight")

        fill_in :flight_number, with: @flight3.number
        click_button "Add Passenger to Flight"
      end

      expect(current_path).to eq(passengers_path(@passenger1))

      within ".passenger-flights" do
        expect(page).to have_content(@flight1.number)
        expect(page).to have_content(@flight2.number)

        expect(page).to have_content(@flight3.number)
      end
    end

    it "I can only add a passenger to a single flight once" do
      visit passengers_path(@passenger1)

      expect(FlightPassenger.count).to eq(2)

      within "#passenger-flight-assignment-form" do
        fill_in :flight_number, with: @flight3.number
        click_button "Add Passenger to Flight"
      end

      expect(FlightPassenger.count).to eq(3)

      within "#passenger-flight-assignment-form" do
        fill_in :flight_number, with: @flight3.number
        click_button "Add Passenger to Flight"
      end

      expect(FlightPassenger.count).to eq(3)

      expect(page).to have_content("#{@passenger1.name} is already on Flight #{@flight3.number}.")
    end
  end
end
