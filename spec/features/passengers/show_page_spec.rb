require "rails_helper"

RSpec.describe "Passenger Show Page Spec" do
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

    @flight3 = Flight.create(number: "465",
                  date: "08/03/20",
                  time: "8:00 AM",
                  departure_city: "Denver",
                  arrival_city: "Reno",
                  airline_id: @frontier.id)
    @flight4 = Flight.create(number: "1201",
                  date: "08/03/20",
                  time: "8:00 AM",
                  departure_city: "Denver",
                  arrival_city: "Reno",
                  airline_id: @frontier.id)

    @passenger1 = Passenger.create(name: "Jill", age: 21)
    @passenger2 = Passenger.create(name: "Jamie", age: 28)

    @flight1.passengers << @passenger1
    @flight2.passengers << @passenger1

    @flight3.passengers << @passenger2
    @flight4.passengers << @passenger2
  end

  describe "As a visitor to a passengers show page" do
    describe "I see details for a passenger" do
      before :each do
        visit "/passengers/#{@passenger1.id}"
      end

      it "There is that passengers name" do
        within ".passenger-name" do
          expect(page).to have_content(@passenger1.name)
        end
      end

      it "There is a section of all flight numbers of the flights for that passenger" do
        within ".passenger-flights" do
          expect(page).to have_content(@flight1.number)
          expect(page).to have_content(@flight2.number)
        end
      end

      it "All flight numbers are links to that flight’s show page" do
        within ".passenger-flights" do
          expect(page).to have_link(@flight1.number, href: flights_path(@flight1))
          expect(page).to have_link(@flight2.number, href: flights_path(@flight2))
        end
      end
    end

    describe "I see different details for a different passenger" do
      before :each do
        visit "/passengers/#{@passenger2.id}"
      end

      it "There is that passengers name" do
        within ".passenger-name" do
          expect(page).to have_content(@passenger2.name)
        end
      end

      it "There is a section of all flight numbers of the flights for that passenger" do
        within ".passenger-flights" do
          expect(page).to have_content(@flight3.number)
          expect(page).to have_content(@flight4.number)
        end
      end

      it "All flight numbers are links to that flight’s show page" do
        within ".passenger-flights" do
          expect(page).to have_link(@flight3.number, href: flights_path(@flight3))
          expect(page).to have_link(@flight4.number, href: flights_path(@flight4))
        end
      end
    end
  end
end
