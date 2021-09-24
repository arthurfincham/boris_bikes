require './lib/bike'

class DockingStation
  
  attr_reader :docked_bikes, :capacity
  
  def initialize(capacity = 20)
    @capacity = capacity
    @docked_bikes = []
  end
  
  def release_bike
    raise StandardError.new "No bikes at all" if empty?
    raise StandardError.new "No working bikes" unless contains_working_bike?
    if contains_working_bike?
      x = find_first_working_bike
      remove_first_working_bike(find_first_working_bike)
    # else
    #   raise StandardError.new "No working bikes"
    end
  end

  def contains_working_bike?
    response = false
    @docked_bikes.each do |x|
      if x.working == true
        response = true
      end
    end
    response
  end

  def find_first_working_bike
    @docked_bikes.index { |x| x.working == true}
  end

  def remove_first_working_bike(index)
    @docked_bikes.delete_at(index)
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
    @docked_bikes.length == @capacity
  end

  def empty?
    @docked_bikes.empty?
  end

end