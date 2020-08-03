class Flight < ApplicationRecord
  belongs_to :airline
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  def self.get_flight_id_from_flight_number(flight_number)
    self.where(number: flight_number).distinct.first.id
  end

  def count_minor_passengers
    passengers.where("age < ?", 18).count
  end

  def count_adult_passengers
    passengers.where("age >= ?", 18).count
  end
end
