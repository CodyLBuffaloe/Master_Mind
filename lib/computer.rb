
  class Computer
    require "./colors"
    require "./hint"
      attr_accessor :code, :color_set

      def initialize
        @code = []
        @color_set = Colors.new.color_set
      end

      def create_code()
        return generate_set()
      end
    def provide_guess()
      @code = []
      guess = create_code()
      return guess
    end

      def generate_set
        #randomly generates a 4 element array of nums between 1 and 6
        while @code.size <= 3
          @code << rand(1..6)
        end
        #turns those array integers into the colors that must be guessed
        @code.each_with_index do |el, index|
          @color_set.each do |key, value|
            if(@code[index]== key)
              @code[index] = value
            end
          end
        end
        return @code
      end
    def create_full_combos()
      all_combos = Array.new(1296) {Array.new(4) {Array.new}}
      all_combos.each do |a|
        for i in 1..6
          a[0] << i
        end
        for j in 1..6
          a[1] << j
        end
        for k in 1..6
          a[2] << k
        end
        for l in 1..6
          a[3] << l
        end
      end
      puts all_combos.length
      puts all_combos[3].class
      puts all_combos[1265].class
      puts all_combos[1200][1].class
      puts all_combos[1150][1].length
      puts all_combos[1150][1]

    end
  end

  c = Computer.new
  c.create_full_combos()

