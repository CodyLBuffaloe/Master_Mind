module MasterMind
  class Game
    attr_reader :players, :board

    def initialize(board = Board.new, players, guesses = 12)
      @board = board
      @players = players
      @guesses = guesses
    end

    def get_guess(guess = gets.join(",").chomp)
      guess_coordinates(guess)
    end

    def guess_coordinates
      while(@guesses > 0)

        @guesses -= 1
      end
    end


  end
end
