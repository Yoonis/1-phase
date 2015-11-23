require_relative 'Flashcard'
require_relative 'FileParser'

class Deck
attr_reader :cards

  def initialize(content)
    @cards = content.map { |card| Flashcard.new(card[0], card[1]) }
  end

end

# deck = Deck.new(FileParser.new("flashcard_samples.txt").parse)
