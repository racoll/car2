require "car"

RSpec.describe Car do

  subject(:car) { described_class.new }

  it "has an empty fuel tank" do
    expect(car.fuel).to eq 0
  end

  describe "#refuel" do

    it "can be refueled" do
      car.refuel
      expect(car.fuel).to eq 4
    end

  end

end
