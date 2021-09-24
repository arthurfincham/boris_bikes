require 'van'
require 'bike'
require 'docking_station'

describe Van do
  it 'collects a broken bike' do
    bike = Bike.new
    bike.broken
    ds = DockingStation.new
    ds.dock_a_bike(bike)
    v1 = Van.new
    v1.collect_broken_bikes(ds)
    expect(v1.docked_bikes.length).to eq 1
  end

  it 'collects broken bikes up to its capacity' do
    array = []
    6.times { array.append(Bike.new) }
    # print array
    array.each { |x| x.broken }
    # print array
    ds = DockingStation.new
    array.each { |x| ds.dock_a_bike(x)}
    v1 = Van.new
    expect{ v1.collect_broken_bikes(ds) }.to raise_error("Van is at capacity")
  end

end