module MasterMind
  class Game
    require "./board.rb"
    attr_reader :players, :board, :guesses, :guess

    def initialize(board = Board.new, guesses = 1)
      @board = board
      #@players = players
      @guesses = guesses


    end

    def get_guess(guess)
     #gets.split()
     current_guess = []
     guess.each do |x|
       current_guess << x.to_sym
     end
     return current_guess
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

    def play
      while guesses >= 0

        puts ""
        puts solicit_guess
        this_guess = get_guess(["red", "blue", "green", "yellow"])
        board.draw_guess_grid(this_guess)
        #if board.game_over
         # puts game_over_message
          #return
        #end
        @guesses -=1
      end

    end

  private

    def guess_to_coordinate(guess)

    end

  end
end


g = MasterMind::Game.new()
g.play
g.get_guess(["red", "blue", "green", "yellow"])
g.get_guess(["red", "blue", "green", "yellow"])
