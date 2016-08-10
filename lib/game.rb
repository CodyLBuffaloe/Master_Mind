require "./board.rb"
require "./computer.rb"


  class Game
    attr_reader :players, :board, :guesses, :guess, :computer
    attr_accessor :secret_code
    @board
    @computer
    @guesses
    @secret_code
    def initialize(board = Board.new, guesses = 1, computer = Computer.new)
    @board = board
    @computer = computer
    @guesses = guesses
    @secret_code = @computer.create_code()

    end

    def get_guess()
      guess = "red blue green yellow".split()
      current_guess = []
      guess.each do |x|
        current_guess << x.to_sym
      end
      board.print_guess(current_guess)
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

      while @guesses <= 12
        puts ""
        puts solicit_guess
        this_guess = get_guess()
        board.draw_guess_grid(this_guess)
        #if board.game_over
         # puts game_over_message
          #return
        #end
        @guesses +=1
      end

    end

  private



  end



g = Game.new()

g.play
