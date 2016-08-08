module MasterMind
  class Board
    require './block'
    attr_reader :guess_grid, :hint_grid
    attr_accessor :all_guesses
    def initialize(input = {})
      @guess_grid = input.fetch(guess_grid, default_grid)
      @hint_grid = input.fetch(:hint_grid, default_grid)
      @all_guesses = []
    end

    def print_guess(current_guess)
      @all_guesses << current_guess

    end

    def draw_guess_grid(all_guesses)
      puts @all_guesses.length
      @all_guesses.each do |line|
        puts line
      end
      puts "\n"
      puts @all_guesses.length

      guesses_left = @all_guesses.length
      (12 - guesses_left).times do
        puts "_ _ _ _"

      end
    end



   #def game_over
    #  if(winner?)
     #   return :winner
      #else
       # return false
      #end
    #end

    def formatted_boards
      puts "Guess Board     Hint Board"
      g_row = []
      guess_grid.each do |row|
         g_row << row.map{ |block| block.value.empty? ? "__" : block.value }.join(" ")
      end
      h_row = []
      hint_grid.each do |row|
         h_row << row.map{ |block| block.value.empty? ? "__" : block.value }.join(" ")
      end
      g_row.each_with_index do |row, index|
        puts row.strip + "     " + h_row[index].strip

      end
    end



#    def winner?
#      if
#      end
#    end

    private

    def default_grid
      Array.new(12) { Array.new(4) { Block.new } }
    end
  end
end


