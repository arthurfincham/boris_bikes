require './lib/bike'

class DockingStation

  DEFAULT_CAPACITY = 20
  
  attr_reader :docked_bikes
  
  def initialize
    @docked_bikes = []
  end
  
  def release_bike
    raise StandardError.new "There are no bikes" if empty?
    
  end
  
  def dock_a_bike(docking_bike)
    raise StandardError.new "Dock is at max capacity" if full?
    @docked_bikes << docking_bike
  end

  def are_there_bikes
    !@docked_bikes.empty?
  end

  private

  def full?
    @docked_bikes.length == DEFAULT_CAPACITY
  end

  def empty?
    @docked_bikes.empty?
  end

end