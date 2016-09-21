require "./board.rb"
require "./computer.rb"
require "./hint.rb"


  class Game
    attr_reader :players, :board, :guesses, :guess, :computer
    attr_accessor :secret_code

    def initialize()
      @board = Board.new
      @computer = Computer.new
      @guesses = 1
      @secret_code
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
      if(@codebreaker == :human)
        puts "Player, enter four of the six following colors to make your guess at the code:\n red, blue, green, yellow, purple and orange"
      elsif(@codebreaker == :computer)
        puts "Now the computer will take a guess at the code:"
      end
    end

    def game_over_message(message)
      if(@codebreaker == :human)
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
      elsif(@codebreaker == :computer)
        case message
          when :winner
            puts "The computer guessed the code! Bow to our robot overlords! Would you like to play again, puny human?"
            answer = gets.chomp
          when :not_yet
            if(@guesses == 12)
              puts "The computer was not able to guess the code! We are safe once again from robot domination! \n Tempt fate again, human? Type yes or no."
              answer = gets.chomp
            end
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

      if(@codebreaker == :human)
        @secret_code = @computer.create_code()
        while @guesses <= 12
          puts "\n"
          puts solicit_guess()
          puts @secret_code
          this_guess = get_guess()
          puts this_guess.class
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

      else
          puts "Okay, huuman, make a code of four of these colors (repeats okay): \n red, blue, orange, green, yellow, purple"
          @secret_code = gets.split()
          @secret_code.map!{ |x| x.to_sym}
          correct_code = @secret_code
          hint = @hint
          while @guesses <= 12
            puts solicit_guess()
            if(@guesses == 1)
              this_guess = computer.provide_first_guess()
              previous_guess = this_guess
              @computer.remove_losers(hint, this_guess, correct_code)
            else
              this_guess = computer.provide_next_guess()
              @computer.remove_losers(hint, this_guess, previous_guess)
            end
            puts "\n\n"
            puts board.draw_guess_grid(this_guess)
            puts "\n\n"
            puts @hint.draw_hint_grid(this_guess, correct_code)
            board.win?(secret_code, this_guess)
            message = board.game_over()
            if(board.game_over() == :winner || board.game_over() == :not_yet)
              game_over_message(message)
            end
            @guesses += 1
          end
      end
    end
  end



g = Game.new()

g.play
