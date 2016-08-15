require "./board.rb"
require "./computer.rb"
require "./hint.rb"


  class Game
    attr_reader :players, :board, :guesses, :guess, :computer
    attr_accessor :secret_code

    def initialize(board = Board.new, guesses = 1, computer = Computer.new)
      @board = board
      @computer = computer
      @guesses = guesses
      @secret_code = @computer.create_code()
    end

    def get_guess(guess = gets.split())
      current_guess = []
      guess.each do |x|
        current_guess << x.to_sym
      end
      return current_guess
    end





    def solicit_guess
      puts "Player, enter four of the six following colors to make your guess at the code:\n red, blue, green, yellow, purple and orange"
    end

    def game_over_message(message)
      if(message == :winner)
        puts "Congrats, you won! Would you like to play again? 'yes' or 'no' "
        answer = gets.chomp
      elsif(message == :not_yet && @guesses == 12)
        puts "You didn't yet guess the code! Would you like to try again? Type yes or no."
        answer = gets.chomp
      end

      if(answer == "yes")
        Game.new.play
      else
        exit
      end
    end

    def play
      while @guesses <= 12
        puts ""
        puts solicit_guess
        puts @secret_code
        this_guess = get_guess()
        puts "\n\n"

        puts [board.draw_guess_grid(this_guess)], [Hint.new(this_guess, secret_code).draw_hint_grid]
        board.win?(secret_code, this_guess)
        if(board.game_over() == :winner)
          game_over_message(:winner)
          break
        elsif(board.game_over() == :not_yet)
          game_over_message(:not_yet)
        end
        @guesses +=1
      end
      p @secret_code
    end

  end



g = Game.new()

g.play
