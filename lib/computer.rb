module MasterMind
  class Computer
      attr_accessor :code


      def initialize
        @code = []
        puts "#initialize has been called"
      end

      def create_code
#randomly generates a 4 element array of nums between 1 and 6
        puts "code"
        puts @code
        puts @code.size
        while @code.size <= 3
          @code << rand(1..6)
        end
        puts "code"
        puts @code
        puts @code.size
        puts @code.join(",")
        puts @code.class
        puts Board::color_set
#turns those array integers into the colors that must be guessed
        @code.each_with_index do |el, index|
          @color_set.each do |key, value|
            if(@code[index]== key)
              @code[index] = value
            end
          end
        end
        puts @code
      end
    end
end
al = MasterMind::Computer.new
al.create_code