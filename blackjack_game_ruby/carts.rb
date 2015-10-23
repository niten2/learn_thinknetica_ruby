class Carts
  attr_reader :value

  SUITS = ['♥', '♦', '♣', '♠']
  RANKS = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
  VALUES = [[1, 11], [2], [3], [4], [5], [6], [7],
            [8], [9], [10], [10], [10], [10]]

  def initialize(rank, suit, value)
    @rank = rank
    @suit = suit
    @value = value
  end

  def self.create_deck
    deck = []
    SUITS.each do |suit|
      RANKS.each_with_index do |rank, i|
        deck << Carts.new(rank, suit, VALUES[i])
      end
    end
    deck.sort_by! { rand }
    deck
  end

  def face
    rank + suit
  end

  private

  attr_reader :rank, :suit
end
