class Car

  MAXIMUM_FUEL = 4

  attr_reader :fuel, :in_journey

  def initialize
    @fuel = 0
    @in_journey = false
  end

  def refuel(amount)
    fail "Maximum fuel of #{MAXIMUM_FUEL} exceeded" if amount + fuel > MAXIMUM_FUEL
    @fuel += amount
  end

  def deduct_fuel(amount)
    @fuel -= amount
  end

  def in_journey?
    @in_journey
  end

  def drive
    @in_journey = true
  end

end
