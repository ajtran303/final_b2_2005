# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
