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

  def collect_broken_bikes(docking_station)
  # Loop do
  #   is there capacity for more bikes in the van
  #   ask whether there is a broken bike in the dockingstation
  #   remove the first broken bike from the dock
  #   put the bike in the van
  end

  def deliver_broken_bikes(garage)
    # loop do
    #   ask whether there is a broken bike in the van
    #   ask whether there is space in the garage for the bike
    #   remove bike from van
    #   put bike in garage
  end

  private

  def full?
    @docked_bikes.length == @capacity
  end

  def empty?
    @docked_bikes.empty?
  end

end