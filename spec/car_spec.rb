require "car"

RSpec.describe Car do

  let(:start_location) { double :location }
  let(:end_location) { double :location }

  subject(:car) { described_class.new }

  it "has an empty fuel tank" do
    expect(car.fuel).to eq 0
  end


  it "is initially not in a journey" do
    expect(car.in_journey?).to eq false
    # expect(car).not_to be_in_journey
  end

  it "stores the start location" do
    car.refuel(4)
    car.drive(start_location)
    expect(car.start_location).to eq start_location
  end

  it 'stores the end location' do
    car.refuel(4)
    car.drive(start_location)
    car.stop(end_location)
    expect(car.end_location).to eq end_location
  end

  it 'has an empty list of journeys by default' do
    expect(car.journeys).to be_empty
  end


  describe "#drive" do

    it "can drive" do
      car.refuel(4)
      car.drive(start_location)
      expect(car.in_journey?).to eq true
    end

  end



  describe "#stop" do

    it "can stop" do
      car.refuel(4)
      car.drive(start_location)
      car.stop(end_location)
      expect(car.in_journey?).to eq false
    end

    it "will not be able to drive if fuel below minimum" do
      expect{ car.drive(start_location) }.to raise_error "Insufficient fuel to drive"
    end

    it "can reduce the amount of fuel" do
      car.refuel(4)
      car.drive(start_location)
      expect{ car.stop(end_location) }.to change{ car.fuel }.by(-Car::MINIMUM_FUEL)
    end

    it "deducts fuel from the car when it stops" do
      car.refuel(4)
      expect { car.stop(end_location) }.to change{ car.fuel }.by(-Car::MINIMUM_FUEL)
    end

  end



  describe "#refuel" do

    it { is_expected.to respond_to(:refuel).with(1).argument }

    it "can refuel the car" do
      expect { car.refuel(4) }.to change{ car.fuel }.by 4
      # car.refuel(4)
      # expect(car.fuel).to eq 4
    end

    it "raises an error if max fuel is exceeded" do
      maximum_fuel = Car::MAXIMUM_FUEL
      car.refuel(maximum_fuel)
      expect { car.refuel 1 }.to raise_error "Maximum fuel of #{4} exceeded"
    end

  end

end
