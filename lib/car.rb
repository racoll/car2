class Car

  MAXIMUM_FUEL = 4
  MINIMUM_FUEL = 1

  attr_reader :fuel, :in_journey, :start_location, :end_location, :journeys

  def initialize
    @fuel = 0
    @in_journey = false
    @journeys = []
  end

  def refuel(amount)
    fail "Maximum fuel of #{MAXIMUM_FUEL} exceeded" if amount + fuel > MAXIMUM_FUEL
    @fuel += amount
  end

  # def deduct_fuel(amount)
  #   @fuel -= amount
  # end

  def in_journey?
    !!start_location
  end

  def drive(start_location)
    fail "Insufficient fuel to drive" if @fuel < MINIMUM_FUEL
    # @in_journey = true
    @start_location = start_location
    @journeys << start_location
  end

  def stop(end_location)
    deduct_fuel(MINIMUM_FUEL)
    @start_location = nil
    # @end_location = end_location
    @journeys << end_location
  end

private

  def deduct_fuel(amount)
    @fuel -= amount
  end


end
