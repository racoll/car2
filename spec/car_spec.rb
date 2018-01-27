require "car"

RSpec.describe Car do

  subject(:car) { described_class.new }


  it "has an empty fuel tank" do
    expect(car.fuel).to eq []
  end
end
