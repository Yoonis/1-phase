class GameView

  @@try_again_messages = ["Get your shit together.",
                          "Really?",
                          "*Facepalm*"]

  @@correct_messages = ["Kudos",
                        "Solid work",
                        "You're on your A game"]

  def initialize()
  end

  def welcome
    puts "Welcome!\n- 3 guesses max\n- Google not allowed\n- TEST YOUR LIMITS\n ❚█══█❚ ¯\\_(ツ)_/¯ ❚█══█❚"
  end

  def display_prompt(flashcard)
    puts flashcard.prompt
  end

  def display_correct
    puts @@correct_messages.sample
  end

  def display_try_again
    puts @@try_again_messages.sample
  end

  def display_incorrect(flashcard)
    puts "The answer was actually: #{flashcard.answer}"
  end

end