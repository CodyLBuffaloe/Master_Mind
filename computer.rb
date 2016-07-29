module MasterMind
  class Computer
      attr_reader :value
      attr_accessor :color_set

      def initialize(value)

      end

      def create_code(color_set)
        code = []
    #randomly generates a 4 element array of nums between 1 and 6
        while code.size < 3
          code << rand(1..6)
        end
    #turns those array integers into the colors that must be guessed
        code.each_with_index do |el, index|
          color_set.each do |key, value|
            if(code[index]== key)
              code[index] = value
            end
          end
        end
        return code
      end
    end
end