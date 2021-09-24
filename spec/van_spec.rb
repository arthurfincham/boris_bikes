require './lib/bike'

class Van

  attr_reader :docked_bikes, :capacity
    
  def initialize(capacity = 5)
    @capacity = capacity
    @docked_bikes = []
  end

  def dock_a_bike(docking_bike)
    raise StandardError.new "Dock is at max capacity" if full?
    @docked_bikes << docking_bike
  end

  def release_bike
    raise StandardError.new "No bikes at all" if empty?
    @docked_bikes.pop
  end

  private

  def full?
    @docked_bikes.length == @capacity
  end

  def empty?
    @docked_bikes.empty?
  end

end