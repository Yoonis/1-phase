# Do you fully understand the logic of the game?
# NO

# What classes (state and behavior) do you need?
# -- FileParser
# -- Flashcard
# -- Deck
# -- GameView
# -- GameEngine

# What are the responsibilities of each class? Are they single responsibilities?
# -- FileParser: Load source, parse, save to an array with attr_accessor 
# -- Flashcard: Contains prompt and answer with attr_reader :prompt, :answer
# -- Deck: Instantiates card objects from an array
# -- GameView: Displays welcome message, flashcard prompts, and results of answers
# -- GameEngine: Contains game logic and driver code that will call Parser and View methods depending on ARGV input

# Which methods should be public? Which should be private?
# -- 