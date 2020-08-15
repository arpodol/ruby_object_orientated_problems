class Card
  include Comparable
  attr_reader :rank, :suit
  COMPARISON_HASH = {'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{@rank} of #{@suit}"
  end

  def value
    COMPARISON_HASH.fetch(@rank, @rank)
  end

  def <=>(other)
    value <=> other.value
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @card_array = []
    populate_deck
  end

  def draw
    populate_deck if @card_array.empty?
    @card_array.pop
  end

  def populate_deck
    RANKS.each do |rank|
      SUITS.each do |suit|
        @card_array << Card.new(rank, suit)
      end
    end
    shuffle_deck
  end

  def shuffle_deck
    @card_array.shuffle!
  end

end



class PokerHand
  HAND_SIZE = 5
  def initialize(deck)
    @hand = []
    HAND_SIZE.times do
      @hand << deck.draw
    end

  end

  def print
    puts 'Your hand is:'
    @hand.each { |card| puts card}
  end

  def evaluate
    case
      when royal_flush?     then 'Royal flush'
      when straight_flush?  then 'Straight flush'
      when four_of_a_kind?  then 'Four of a kind'
      when full_house?      then 'Full house'
      when flush?           then 'Flush'
      when straight?        then 'Straight'
      when three_of_a_kind? then 'Three of a kind'
      when two_pair?        then 'Two pair'
      when pair?            then 'Pair'
      else                       'High card'
    end
  end

  private

  def royal_flush?
    if straight_flush?
      @hand.last.value == 14
    end
  end

  def straight_flush?
    if flush?
      straight?
    end
  end

  def four_of_a_kind?
    return_value = false
    Deck::RANKS.each do |rank|
      if @hand.count { |card| card.rank == rank } == 4
        return_value = true
      end
    end
    return_value
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def flush?
    @hand.all? { |card| card.suit == @hand[0].suit }
  end

  def straight?
    @hand.sort!
    ((@hand.last.value - @hand.first.value) == HAND_SIZE - 1 ) &&
      ((@hand[-1].value - @hand[1].value ) == HAND_SIZE - 2 )
  end

  def three_of_a_kind?
    return_value = false
    Deck::RANKS.each do |rank|
      if @hand.count { |card| card.rank == rank } == 3
        return_value = true
      end
    end
    return_value
  end

  def two_pair?
    total_pairs = 0
    Deck::RANKS.each do |rank|
      if @hand.count { |card| card.rank == rank } == 2
        total_pairs += 1
      end
    end
    total_pairs == 2 ? true : false
  end

  def pair?
    return_value = false
    Deck::RANKS.each do |rank|
      if @hand.count { |card| card.rank == rank } == 2
        return_value = true
      end
    end
    return_value
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
                       Card.new(10,      'Hearts'),
                       Card.new('Ace',   'Hearts'),
                       Card.new('Queen', 'Hearts'),
                       Card.new('King',  'Hearts'),
                       Card.new('Jack',  'Hearts')
                     ])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
                       Card.new(8,       'Clubs'),
                       Card.new(9,       'Clubs'),
                       Card.new('Queen', 'Clubs'),
                       Card.new(10,      'Clubs'),
                       Card.new('Jack',  'Clubs')
                     ])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
                       Card.new(3, 'Hearts'),
                       Card.new(3, 'Clubs'),
                       Card.new(5, 'Diamonds'),
                       Card.new(3, 'Spades'),
                       Card.new(3, 'Diamonds')
                     ])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
                       Card.new(3, 'Hearts'),
                       Card.new(3, 'Clubs'),
                       Card.new(5, 'Diamonds'),
                       Card.new(3, 'Spades'),
                       Card.new(5, 'Hearts')
                     ])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
                       Card.new(10, 'Hearts'),
                       Card.new('Ace', 'Hearts'),
                       Card.new(2, 'Hearts'),
                       Card.new('King', 'Hearts'),
                       Card.new(3, 'Hearts')
                     ])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
                       Card.new(8,      'Clubs'),
                       Card.new(9,      'Diamonds'),
                       Card.new(10,     'Clubs'),
                       Card.new(7,      'Hearts'),
                       Card.new('Jack', 'Clubs')
                     ])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
                       Card.new('Queen', 'Clubs'),
                       Card.new('King',  'Diamonds'),
                       Card.new(10,      'Clubs'),
                       Card.new('Ace',   'Hearts'),
                       Card.new('Jack',  'Clubs')
                     ])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
                       Card.new(3, 'Hearts'),
                       Card.new(3, 'Clubs'),
                       Card.new(5, 'Diamonds'),
                       Card.new(3, 'Spades'),
                       Card.new(6, 'Diamonds')
                     ])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
                       Card.new(9, 'Hearts'),
                       Card.new(9, 'Clubs'),
                       Card.new(5, 'Diamonds'),
                       Card.new(8, 'Spades'),
                       Card.new(5, 'Hearts')
                     ])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
                       Card.new(2, 'Hearts'),
                       Card.new(9, 'Clubs'),
                       Card.new(5, 'Diamonds'),
                       Card.new(9, 'Spades'),
                       Card.new(3, 'Diamonds')
                     ])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
                       Card.new(2,      'Hearts'),
                       Card.new('King', 'Clubs'),
                       Card.new(5,      'Diamonds'),
                       Card.new(9,      'Spades'),
                       Card.new(3,      'Diamonds')
                     ])
puts hand.evaluate == 'High card'


# Further exploration
# If we wanted the individual classification methods to be public
# class methods, we could remove the evaluate logic. We also would
# have to make the class methods public so they could be accessed from
# outside the class.
#
# If we wanted to have the program choose the better hand between two,
# we could set up a hash with a value corresponding to each of the types of hands.
# I.e., high card = 0, pair = 1, etc. Then compare, in unique cases such as if both
# players have a high card, that would be calculated.
#
# If we wanted to choose the best 5 card hand from 7 cards, we could first see if
# overall, royal_flush? == true, straight_flush == true? etc. There would need
# to be a generalized 5/n cards case for say a straight flush, i.e., sort the cards
# and see if any of the 3 contiguous 5 card runs is a flush.