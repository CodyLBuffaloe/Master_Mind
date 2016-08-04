module MasterMind
  class Game
    require "./board.rb"
    attr_reader :players, :board, :guesses, :guess

    def initialize(board = Board.new, guesses = 1)
      @board = board
      #@players = players
      @guesses = guesses
      @guess = []
    end

    def get_guess(guess = ["red", "blue", "green", "yellow"] )
     #gets.split(" ")
     puts guess
     guess.each do |x|
       @guess << x.to_sym
     end
     @guess.each_with_index do |x, i|
       puts "#{x}, #{i}"
     end
    end



    def solicit_guess
      puts "Player, enter four of the six following colors to make your guess at the code:\n red, blue, green, yellow, purple and orange"
    end

    def game_over_message
      #if(board.game_over == :winner)
       # puts "Congrats, you won!"
     # else
      #  puts "You didn't guess the code! Would you like to try again? Type yes or no."
       # answer = gets.chomp
        #if(answer == "yes")
         # Game.new
        #else
         # exit
        #end
     # end
    end

    #def play
     # while true
      #  board.formatted_boards
       # puts ""
        #puts solicit_guess

        #board.set_block(x, y, guess)
        #if board.game_over
         #puts game_over_message
         #return
        #end
      #end
    #end

  private

    def guess_to_coordinate(guess)

    end

  end
end


g = MasterMind::Game.new()
g.get_guess
