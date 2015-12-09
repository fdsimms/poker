require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

  describe "#populate" do

    it "contains 52 cards" do
      expect(deck.cards.length).to eq(52)
      expect(deck.cards.all? {|card| card.is_a?(Card)}).to eq(true)
    end

    it "contains only unique cards" do
      expect(deck.cards).to eq(deck.cards.uniq)
    end
  end

  describe "#shuffle" do
    it "shuffles the deck" do
      original_deck = deck.cards.dup
      deck.shuffle!
      expect(deck.cards).to_not eq(original_deck)
    end
  end

end
