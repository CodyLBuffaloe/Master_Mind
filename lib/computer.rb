
  class Computer
    require "./colors"
    require "./hint"
      attr_accessor :code, :color_set

      def initialize
        @code = []
        @color_set = Colors.new.color_set
        @all_combos = []
      end

      def create_code()
        return generate_set()
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
    # push a section of four numbers to each array subscript, until no array is empty
        for i in 1..6
          for j in 1..6
            for k in 1..6
              for l in 1..6
                permutation = [i, j, k, l]
                @all_combos << permutation
              end
            end
          end
        end
      @all_combos.each do |sub|
        sub.each_with_index do |el, index|
          @color_set.each do |key, value|
            if(sub[index] == key)
              sub[index] = value
            end
          end
        end
      end
    end

    def provide_guess()
      create_full_combos()
      return @all_combos.sample()
    end
  end

  c = Computer.new
  c.create_full_combos()

