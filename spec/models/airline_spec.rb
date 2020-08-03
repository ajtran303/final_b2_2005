require "rails_helper"

RSpec.describe Airline do
  describe "associations" do
    it { should have_many :flights }
  end
end
