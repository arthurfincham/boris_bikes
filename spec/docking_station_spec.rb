require 'docking_station'

checker = DockingStation.new

describe DockingStation do
  it 'instances respond to release_bike' do
    expect(checker).to respond_to(:release_bike)
  end
end