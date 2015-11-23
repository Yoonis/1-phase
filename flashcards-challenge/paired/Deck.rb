require_relative 'parser'
require 'pry'

class Deck
  attr_reader :deck
  attr_accessor :user_input, :deck_counter, :error_counter

  def initialize(args = {})
    @deck = Parser.new.load_file
    @user_input = user_input
    @deck_counter = 0
    @error_counter = 0
  end

  def welcome_message
    puts "Welcome to Fancy Flash Cards Co. Suit your fancy and enter the right answers! 3 tries only\n------------------\\(ˆ˚ˆ)/-----------------"
  end

  def question
    puts "------------------------------------------\n#{@deck[deck_counter].question}"
  end

  def answer
    puts "(╯°□°）╯︵ ┻━┻ \nThe answer is... #{@deck[deck_counter].answer}!"
  end

  def progress
    self.error_counter = 0
    self.deck_counter += 1
  end

  def pick_card
    while deck_counter < deck.size
      user_input = gets.chomp

      if user_input == "exit"
        break
      end
      if error_counter == 0
        question
      end
      if user_input == deck[deck_counter].answer
        progress
      elsif error_counter == 2
        answer
        progress
      else
        self.error_counter += 1
        puts "Try again."
      end
    end
  end

end

classy = Deck.new
classy.welcome_message
classy.pick_card

# if ARGV[0] == "start"
#   classy.welcome_message
#   classy.pick_card
# end
