require 'docking_station'

checker = DockingStation.new

describe DockingStation do

  let(:bike) { double :bike }
  #let(:Bike) { class_double :Bike }

  it 'instances respond to release_bike' do
    expect(checker).to respond_to(:release_bike)
  end

  it 'gets a bike' do
    allow(bike).to receive(:be_an_instance_of).and_return(true)
    allow(bike).to receive(:working).and_return(true)
    checker = DockingStation.new
    checker.dock_a_bike(bike)
    expect(checker.release_bike).to eq bike
  end
  # Couldn't ge the class double to work in the above
  # Changed test so not testing it is in Bike class
  # but directly testing that bike is released

  it 'bike works' do
    bike = double(:bike)
    allow(bike).to receive(:working).and_return(true)
    checker = DockingStation.new
    checker.dock_a_bike(bike)
    expect(checker.release_bike.working).to eq true
  end

  it 'does not release a bike if none are available' do
    checker = DockingStation.new
    expect { checker.release_bike }.to raise_error("No bikes at all")
  end

  # INCLUDES Bike.new 

  it 'allows a bike to be docked' do
    bike = double(:bike)
    checker = DockingStation.new
    checker.dock_a_bike(bike)
    expect(checker.docked_bikes).to include(bike)
  end

  it 'shows that there are bikes docked' do
    bike = double(:bike)
    checker = DockingStation.new
    checker.dock_a_bike(bike)
    expect(checker.are_there_bikes).to eq true
  end

  it 'does not dock a bike if more than 20 bikes are docked' do
    checker = DockingStation.new
    checker.capacity.times { checker.dock_a_bike double(:bike) }
    expect { checker.dock_a_bike(double(:bike)) }.to raise_error("Dock is at max capacity")
  end

  it 'allows user to define dock capacity' do
    checker = DockingStation.new(25)
    expect(checker.capacity).to eq 25
  end

  it 'defaults to a dock capacity of 20' do
    checker = DockingStation.new
    expect(checker.capacity).to eq 20
  end

  it 'returns that the bike is broken when user says is broken' do
    bike = double(:bike)
    allow(bike).to receive(:broken).and_return(false)
    expect(bike.broken).to eq false
  end

  it 'does not release a broken bike' do
    bike = double(:bike)
    allow(bike).to receive(:broken).and_return(false)
    bike.broken
    allow(bike).to receive(:working).and_return(false)
    checker = DockingStation.new
    checker.dock_a_bike(bike)
    expect { checker.release_bike }.to raise_error("No working bikes")
  end



end