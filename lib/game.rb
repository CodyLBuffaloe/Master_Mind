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
      @hint = Hint.new
      @codemaker
      @codebreaker
    end

    def determine_players()
      puts "Welcome, huuuman. Press 1 to be the codebreaker, or press 2 to make a code."
      answer = gets.chomp
      if( answer == 2.to_s )
        @codebreaker = :computer
        @codemaker = :human
        puts "#{@codebreaker}, #{@codemaker}"
      elsif( answer == 1.to_s )
        @codebreaker = :human
        @codemaker = :computer
        puts "#{@codebreaker}, #{@codemaker}"
      end
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
      case message
        when :winner
          puts "Congrats, you won! Would you like to play again? 'yes' or 'no' "
          answer = gets.chomp
        when :not_yet
          if(@guesses == 12)
            puts "You didn't yet guess the code! Would you like to try again? Type yes or no."
            answer = gets.chomp
          end
      end
      if(answer == "yes")
        Game.new.play
      elsif(answer == "no")
        exit
      end
    end

    def play
      puts determine_players()
      while @guesses <= 12
        puts "\n"
        puts solicit_guess()
        this_guess = get_guess()
        puts "\n\n"
        puts board.draw_guess_grid(this_guess)
        puts "\n\n"
        correct_code = @secret_code
        puts @hint.draw_hint_grid(this_guess, correct_code)
        board.win?(secret_code, this_guess)
        message = board.game_over
        if(board.game_over() == :winner || board.game_over() == :not_yet)
          game_over_message(message)
        end
        @guesses +=1
      end
    end

  end



g = Game.new()

g.play
