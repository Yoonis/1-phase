require_relative('dealership')

describe Car do
  
end


describe CarLoader do
  describe "loader" do
    it "returns an array of Car objects" do
      expect(Dealership.new("inventory.csv").inventory[0]).to be_an_instance_of(Car)
    end
  end
end


describe Dealership do
  let(:cars) {[ Car.new(make: "Honda"),
                Car.new(make: "Toyota"),
                Car.new(make: "Honda")]}

  let(:dealership) { Dealership.new(cars)}

  describe "#find_make" do
    it "finds all cars of a given make" do
      expect(dealership.find_make("Honda").size).to eq(2)
    end

    it "returns an empty array when there are no cars of the given make" do
      expect(dealership.find_make("tesla")).to eq([])
    end
  end

end


