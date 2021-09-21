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

  it 'allows a bike to be docked' do
    dock_length = checker.docked_bikes.length
    expect(checker.dock_a_bike(Bike.new)).to change(checker.docked_bikes, :hello).from(dock_length).to(dock_length + 1)
  end

end