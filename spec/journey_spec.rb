require "journey"
require "car"

describe Journey do

  let(:journey){ double :journey } #this may need to have some methods
  let(:start_location){ double :start_station }
  let(:end_location){double :end_location}
  let(:car_class){double :car_class, new: journey}
  subject {described_class.new(car_class: car_class)}

  describe '#start' do
    it 'starts a journey' do
      expect(car_class).to receive(:new).with(start_location: start_location)
      subject.drive(start_location)
    end

    it 'records a journey' do
      allow(journey).to receive(:new).and_return journey
      subject.drive(start_location)
      expect(subject.journeys).to include journey
    end
  end
end
