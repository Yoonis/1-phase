require_relative 'FileParser'
require_relative 'Flashcard'
require_relative 'Deck'
require_relative 'GameView'
require 'pry'

class GameEngine

  def initialize(parser)
    @card_counter = 0
    @error_counter = 0
    @deck = Deck.new(parser.parse)
    @game_view = GameView.new
    @game_view.welcome
  end

  def play
    while @card_counter < @deck.cards.length
      @error_counter = 0
      current_card = @deck.cards[@card_counter]
      @game_view.display_prompt(current_card)
      user_input = $stdin.gets.chomp
      
      if user_input == "exit"
        break
      end
      
      while @error_counter < 3
        if validate_answer(user_input, current_card)
          @game_view.display_correct
          break
        else
          @game_view.display_try_again
          @error_counter += 1
          user_input = $stdin.gets.chomp  
        end
      end

      if @error_counter == 3
        @game_view.display_incorrect(current_card)
      end

      @card_counter += 1
    end
  end

  def validate_answer(answer, card)
    answer == card.answer
  end


end

# Driver code

file_name = ARGV[0]

if file_name == nil
  puts "Please specify the input file"
else
  parser = FileParser.new(file_name)
  game = GameEngine.new(parser)
  game.play
end
