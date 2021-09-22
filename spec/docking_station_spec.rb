require 'docking_station'

checker = DockingStation.new

describe DockingStation do
  it 'instances respond to release_bike' do
    expect(checker).to respond_to(:release_bike)
  end

  it 'gets a bike' do
    expect(checker.release_bike).to be_an_instance_of(Bike)
  end

  it 'bike works' do
    expect(checker.release_bike.working?).to eq true
  end

  it 'does not release a bike if none are available' do
    expect { checker.release_bike }.to raise_error("There are no bikes")
  end

  # INCLUDES Bike.new 

  it 'allows a bike to be docked' do
    bike = Bike.new
    checker = DockingStation.new
    checker.dock_a_bike(bike)
    expect(checker.docked_bikes).to include(bike)
  end

  it 'shows that there are bikes docked' do
    bike = Bike.new
    checker = DockingStation.new
    checker.dock_a_bike(bike)
    expect(checker.are_there_bikes).to eq true
  end

  it 'does not dock a bike if more than 1 bike is docked' do
    bike = Bike.new
    bike2 = Bike.new
    checker = DockingStation.new
    checker.dock_a_bike(bike)
    expect { checker.dock_a_bike(bike2) }.to raise_error("Dock is at max capacity")
  end

end