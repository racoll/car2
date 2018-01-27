class Car

  attr_reader :fuel

  def initialize
    @fuel = 0
  end

  def refuel(amount)
    @fuel += 4
  end

end
