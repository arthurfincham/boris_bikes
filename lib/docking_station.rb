require './lib/bike'

class DockingStation
  
  attr_reader :docked_bikes
  
  def initialize
    @docked_bikes = []
  end
  
  def release_bike
    if @docked_bikes.empty?
      raise StandardError.new "This is an exception"
    end
  end
  
  def dock_a_bike(docking_bike)
    @docked_bikes << docking_bike
  end

  def are_there_bikes
    !@docked_bikes.empty?
  end

end