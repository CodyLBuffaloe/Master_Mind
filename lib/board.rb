
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

    def win?(secret_code, this_guess)
      secret_code = secret_code.split(",")
      secret_code.map!{ |x| x.to_sym}
      if(secret_code == this_guess)
        @winner = true
      else
        @winner = false
      end
    end

    def game_over
      if(@winner == true)
        return :winner
      else
        return :not_yet
      end
      puts "#game_over got called"
    end

   private

    def default_grid
      Array.new(12) { Array.new(4) { Block.new } }
    end
end