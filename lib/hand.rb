require 'byebug'

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

  NUM_FACE_VALUES = {
    ace: 14,
    king: 13,
    queen: 12,
    jack: 11,
    ten: 10,
    nine: 9,
    eight: 8,
    seven: 7,
    six: 6,
    five: 5,
    four: 4,
    three: 3,
    two: 2,
    low_ace: 1
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
    cards.any? { |card| num_face_value_count(card) == 3 }
  end

  def straight?
    sorted_values = []
    if num_face_values.include?(2)
      num_face_values.each do |value|
        if value == 14
          sorted_values << 1
        else
          sorted_values << value
        end
      end
    else
      sorted_values = num_face_values
    end
    sorted_values.sort!
    (sorted_values.length - 1).times do |idx|
      value = sorted_values[idx]
      next_value = sorted_values[idx + 1]
      return false unless (value + 1) == next_value
    end

    true
  end

  def flush?
    suits = []
    cards.each { |card| suits << card.suit }
    suits.uniq.length == 1
  end

  def full_house?
    face_values.uniq.length == 2
  end

  def four_of_a_kind?
    cards.any? { |card| num_face_value_count(card) == 4 }
  end

  def straight_flush?
    flush? && straight?
  end

  def num_face_value_count(card)
    num_value = NUM_FACE_VALUES[card.face_value]
    selected_cards = num_face_values.select do |num_face_value|
      num_value == num_face_value
    end
    selected_cards.length
  end

  def face_values
    face_values = []
    cards.each do |card|
      face_values << card.face_value
    end

    face_values
  end

  def num_face_values
    num_face_values = []
    cards.each do |card|
      num_face_values << NUM_FACE_VALUES[card.face_value]
    end

    num_face_values
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
