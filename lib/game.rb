module MasterMind
  class Game
    attr_reader :code, :color_set

    def initialize(board = Board.new)
      @board = board

    end
  end
end
