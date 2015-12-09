require_relative 'card'

class Deck

  SUITS = [
    :hearts,
    :spades,
    :diamonds,
    :clubs
  ]

  FACE_VALUES = [
    :ace,
    :king,
    :queen,
    :jack,
    :ten,
    :nine,
    :eight,
    :seven,
    :six,
    :five,
    :four,
    :three,
    :two
  ]

  attr_accessor :cards


  def initialize
    @cards = Array.new
    populate
  end

  def populate
    SUITS.each do |suit|
      FACE_VALUES.each do |face_value|
        cards << Card.new(face_value, suit)
      end
    end
  end

  def shuffle!
    cards.shuffle!
  end

end
