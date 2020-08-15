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



deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.