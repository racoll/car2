class Car

  MAXIMUM_FUEL = 4

  attr_reader :fuel

  def initialize
    @fuel = 0
  end

  def refuel(amount)
    fail "Maximum fuel of #{MAXIMUM_FUEL} exceeded" if amount + fuel > MAXIMUM_FUEL
    @fuel += amount
  end

  def deduct_fuel(amount)
    @fuel -= amount
  end

end
