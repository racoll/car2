require "car"

RSpec.describe Car do

  subject(:car) { described_class.new }

  it "has an empty fuel tank" do
    expect(car.fuel).to eq 0
  end

  describe "#refuel" do

    it { is_expected.to respond_to(:refuel).with(1).argument }

    it "can refuel the car" do
      expect { car.refuel(4) }.to change{ car.fuel }.by 4
      # car.refuel(4)
      # expect(car.fuel).to eq 4
    end

  end

end
