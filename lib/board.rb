
  class Board
    require './block'
    attr_reader :guess_grid, :hint_grid
    attr_accessor :all_guesses
    def initialize(input = {})
      @guess_grid = input.fetch(guess_grid, default_grid)
      @hint_grid = input.fetch(:hint_grid, default_grid)
      @all_guesses = []
      @winner
    end


    def draw_guess_grid(current_guess)
      @all_guesses << current_guess.join(",")
      @all_guesses.each do |line|
        puts line
      end
      guesses_left = @all_guesses.length
      (12 - guesses_left).times do
        puts "_ _ _ _"
      end
    end

    def win_test(secret_code, this_guess)
      this_guess.map! { |color| color.to_sym}

      if(secret_code == this_guess)
        @winner = :winner
      else
        @winner = :not_yet
      end
    end

    def game_over
      if(@winner == :winner)
        return :winner
      else
        return :not_yet
      end
    end

   private

    def default_grid
      Array.new(12) { Array.new(4) { Block.new } }
    end
  end



