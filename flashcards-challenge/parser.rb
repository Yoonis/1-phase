require_relative 'card'

class Parser
  attr_accessor :card_objects

  def load_file
    @load_deck = []
    @card_objects = []

    file = File.foreach("flashcard_samples.txt") do |text|
      @load_deck << text.delete("\n")
      @load_deck.delete("")
    end

    counter = 0
    while counter < @load_deck.size do
      @card_objects << Card.new(@load_deck[counter], @load_deck[counter + 1])
      counter += 2
    end
    @card_objects
  end

end
