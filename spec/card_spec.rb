require 'rspec'
require 'card'

describe Card do
  subject(:card) { Card.new(:two, :hearts) }

  it "has a face value" do
    expect(card.face_value).to eq(:two)
  end

  it "has a suit" do
    expect(card.suit).to eq(:hearts)
  end

end
