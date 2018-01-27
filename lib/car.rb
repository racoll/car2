class Car

  attr_reader :fuel

  def initialize
    @fuel = 0
  end

  def refuel
    @fuel += 4
  end

end
