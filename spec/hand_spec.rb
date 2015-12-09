require 'rspec'
require 'hand'

describe Hand do
  subject(:hand) { Hand.new([1,2,3,4,5]) }

  it "contains five cards" do
    expect(hand.length).to eq(5)
  end
end
