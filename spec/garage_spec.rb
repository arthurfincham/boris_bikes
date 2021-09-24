require 'van'
require 'bike'
require 'garage'

describe Garage do
  it 'allows vans to dock bikes' do
    array = []
    5.times { array.append(Bike.new) }
    array.each { |x| x.broken }
    v1 = Van.new
    array.each { |x| v1.dock_a_bike(x) }
    g1 = Garage.new
    v1.deliver_broken_bikes(g1)
    expect(g1.docked_bikes.length).to eq 5
  end
end