require 'bike'

describe Bike do

  bike = Bike.new

  it 'responds to the method "working?"' do
    expect(bike).to respond_to(:working?)
  end

end