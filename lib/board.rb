module MasterMind
  class Board
    require './block'
    attr_reader :guess_grid, :hint_grid
    def initialize(input = {})
      @guess_grid = input.fetch(:guess_grid, default_grid)
      @hint_grid = input.fetch(:hint_grid, default_grid)
    end

    def get_block(x, y)
      guess_grid[y][x]
      hint_grid[y][x]
    end

    def set_block(x, y, value)
      get_block(x, y).value = value
    end

    def game_over
      if(winner?)
        return :winner
      else
        return false
      end
    end

    def formatted_boards
      puts "Guess Board"
      guess_grid.each do |row|
         row.map{ |block| block.value.empty? ? "__" : block.value }.join(" ")
      end
      puts "Hint Board"
      hint_grid.each do |row|
         row.map{ |block| block.value.empty? ? "__" : block.value }.join(" ")
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

b = MasterMind::Board.new
b.formatted_boards
