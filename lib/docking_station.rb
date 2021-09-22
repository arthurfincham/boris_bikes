require './lib/bike'

class DockingStation
  
  attr_reader :docked_bikes
  
  def initialize
    @docked_bikes = []
  end
  
  def release_bike
    bike = Bike.new
  end
  
  def dock_a_bike(docking_bike)
    @docked_bikes << docking_bike
  end

  def are_there_bikes
    !@docked_bikes.empty?
  end

end