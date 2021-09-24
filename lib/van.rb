require './lib/bike'
require './lib/docking_station'

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
    loop do
      raise StandardError.new "Van is at capacity" if full?
      if docking_station.contains_broken_bike?
        dock_a_bike(docking_station.release_broken_bike)
      else
        break
      end
    end
  end

  def collect_broken_bikes(docking_station)
    loop do
      raise StandardError.new "Van is at capacity" if full?
      if docking_station.contains_broken_bike?
        dock_a_bike(docking_station.release_broken_bike)
      else
        break
      end
    end
  end

  def deliver_broken_bikes(garage)
    loop do
      if !empty? && !garage.full?
        released_bike = @docked_bikes.pop
        garage.dock_a_bike(released_bike)
      else
        break
      end
    end
  end

  def collect_working_bikes(garage)
    loop do
      raise StandardError.new "Van is at capacity" if full?
      if !garage.empty?
        dock_a_bike(garage.release_bike)
      else
        break
      end
    end
  end

  private

  def full?
    @docked_bikes.length == @capacity
  end

  def empty?
    @docked_bikes.empty?
  end

end