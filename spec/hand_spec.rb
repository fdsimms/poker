require 'rspec'
require 'hand'

describe Hand do
  subject(:hand) { Hand.new([1,2,3,4,5]) }

  it "contains five cards" do
    expect(hand.length).to eq(5)
  end

  describe "#one_pair?" do

    let(:card_1) { Card.new(:ace, :hearts) }
    let(:card_2) { Card.new(:ace, :clubs) }
    let(:card_3) { Card.new(:two, :hearts) }
    let(:card_4) { Card.new(:three, :hearts) }
    let(:card_5) { Card.new(:four, :hearts) }
    let(:hand) { Hand.new([card_1, card_2, card_3, card_4, card_5]) }

    it "returns true if hand contains one pair" do
      expect(hand.one_pair?).to eq(true)
    end

    it "returns false if hand contains no pairs" do
      hand.cards[0] = Card.new(:five, :diamonds)
      expect(hand.one_pair?).to eq(false)
    end

  end

  describe "#two_pair?" do
    let(:card_1) { Card.new(:ace, :hearts) }
    let(:card_2) { Card.new(:ace, :clubs) }
    let(:card_3) { Card.new(:two, :hearts) }
    let(:card_4) { Card.new(:two, :clubs) }
    let(:card_5) { Card.new(:four, :hearts) }
    let(:hand) { Hand.new([card_1, card_2, card_3, card_4, card_5]) }

    it "returns true if hand contains two pair" do
      expect(hand.two_pair?).to eq(true)
    end

    it "returns false if hand does not contain two pairs" do
      hand.cards[0] = Card.new(:five, :diamonds)
      expect(hand.two_pair?).to eq(false)
    end

  end

  describe "#three_of_a_kind?" do
    let(:card_1) { Card.new(:ace, :hearts) }
    let(:card_2) { Card.new(:ace, :clubs) }
    let(:card_3) { Card.new(:ace, :spades) }
    let(:card_4) { Card.new(:two, :clubs) }
    let(:card_5) { Card.new(:four, :hearts) }
    let(:hand) { Hand.new([card_1, card_2, card_3, card_4, card_5]) }

    it "returns true if hand contains three cards with same face value" do
      expect(hand.three_of_a_kind?).to eq(true)
    end

    it "returns false if hand does not contain a three-of-a-kind" do
      hand.cards[0] = Card.new(:five, :diamonds)
      expect(hand.three_of_a_kind?).to eq(false)
    end

  end

  describe "#straight?" do
    let(:card_1) { Card.new(:six, :hearts) }
    let(:card_2) { Card.new(:two, :clubs) }
    let(:card_3) { Card.new(:three, :spades) }
    let(:card_4) { Card.new(:four, :clubs) }
    let(:card_5) { Card.new(:five, :hearts) }
    let(:hand) { Hand.new([card_1, card_2, card_3, card_4, card_5]) }

    it "returns true if hand contains five cards of sequential face value" do
      expect(hand.straight?).to eq(true)
    end

    # it "returns true if straight contains an ace" do
    #   expect(hand.straight?).to eq(true)
    # end

    it "returns false if hand does not contain five straight cards" do
      hand.cards[0] = Card.new(:five, :diamonds)
      expect(hand.straight?).to eq(false)
    end

  end

  describe "#num_face_values" do
    let(:card_1) { Card.new(:ace, :hearts) }
    let(:card_2) { Card.new(:ace, :clubs) }
    let(:card_3) { Card.new(:two, :hearts) }
    let(:card_4) { Card.new(:two, :clubs) }
    let(:card_5) { Card.new(:four, :hearts) }
    let(:hand) { Hand.new([card_1, card_2, card_3, card_4, card_5]) }

    it "returns array of numerical card values in the hand" do
      expect(hand.num_face_values).to eq([14, 14, 2, 2, 4])
    end

  end

  describe "#num_face_value_count" do
    let(:card_1) { Card.new(:ace, :hearts) }
    let(:card_2) { Card.new(:ace, :clubs) }
    let(:card_3) { Card.new(:two, :hearts) }
    let(:card_4) { Card.new(:two, :clubs) }
    let(:card_5) { Card.new(:four, :hearts) }
    let(:hand) { Hand.new([card_1, card_2, card_3, card_4, card_5]) }

    it "counts the number of cards with the same face value" do
      expect(hand.num_face_value_count(card_1)).to eq(2)
      expect(hand.num_face_value_count(card_5)).to eq(1)
    end

  end

end
