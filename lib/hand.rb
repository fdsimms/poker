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

  def one_pair?
    face_values.uniq.length == 4
  end

  def two_pair?
    face_values.uniq.length == 3
  end

  def three_of_a_kind?
    cards.any? { |card| face_value_count(card) == 3 }
  end

  def face_value_count(card)
    value = card.face_value
    face_values.select { |face_value| value == face_value }.length
  end

  private
  def face_values
    face_values = []
    cards.each do |card|
      face_values << card.face_value
    end

    face_values
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
