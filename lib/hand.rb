class Hand

  WINNING_HANDS = {
    straight_flush: 9,
    four_of_a_kind: 8,
    full_house: 7,
    flush: 6,
    straight: 5,
    three_of_a_kind: 4,
    two_pair: 3,
    one_pair: 2,
    high_card: 1
  }

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def length
    cards.length
  end

end

# def compare_hand(other_hand)
# def
#
# def find_best_hand_value
#   return value
#
# @best_hand_value
# @Best_hand_high_card = card
