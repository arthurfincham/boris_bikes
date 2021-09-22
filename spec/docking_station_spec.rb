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
    expect { checker.release_bike }.to raise_error
  end

  # INCLUDES Bike.new 

  it 'allows a bike to be docked' do
    bike = Bike.new
    checker.dock_a_bike(bike)
    expect(checker.docked_bikes).to include(bike)
  end

  it 'shows that there are bikes docked' do
    bike = Bike.new
    checker.dock_a_bike(bike)
    expect(checker.are_there_bikes).to eq true
  end

  

end