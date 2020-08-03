require "rails_helper"

RSpec.describe FlightPassenger do
  describe "associations" do
    it { should belong_to :flight }
    it { should belong_to :passenger }
  end
end
