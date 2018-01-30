class Car

  MAXIMUM_FUEL = 4
  MINIMUM_FUEL = 1

  attr_reader :fuel, :in_journey, :start_location

  def initialize
    @fuel = 0
    @in_journey = false
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

  def drive(location)
    fail "Insufficient fuel to drive" if @fuel < MINIMUM_FUEL
    @in_journey = true
    @start_location = location
  end

  def stop
    deduct_fuel(MINIMUM_FUEL)
    @start_location = nil
  end

private

  def deduct_fuel(amount)
    @fuel -= amount
  end


end
