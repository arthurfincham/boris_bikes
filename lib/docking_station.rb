require './lib/bike'

class DockingStation
  
  attr_reader :docked_bikes
  
  def initialize
    @docked_bikes = []
  end
  
  def release_bike
    if @docked_bikes.empty?
      raise StandardError.new "There are no bikes"
    end
  end
  
  def dock_a_bike(docking_bike)
    unless @docked_bikes.empty?
      raise StandardError.new "Dock is at max capacity"
    end
    @docked_bikes << docking_bike
  end

  def are_there_bikes
    !@docked_bikes.empty?
  end

end

# As a maintainer of the system,
# So that I can control the distribution of bikes,
# I'd like docking stations not to accept more bikes than their capacity.