module MasterMind
  class Human
      attr_reader :name
      def initialize(input)
        @name = input.fetch(:name)
      end

      def guesses
        guesses = 12
      end
    end
end
