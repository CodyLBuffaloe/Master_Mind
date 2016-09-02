require "./colors.rb"
class Hint
  def initialize()
    @guess_code
    @correct_code
    @hint_colors = Colors.new.hint_colors
    @all_hints = []
  end



#for each color in guess_code, find how many times it occurs
#then how many times it occurs in correct_code
#only return white markers for the frequency of color
#appearences in correct_code

  def draw_hint_grid(this_guess, correct_code)
    @guess_code = this_guess
    if(correct_code.class != Array)
      @correct_code = correct_code.split(",")
      @correct_code.map!{|x| x.to_sym}
    else
      @correct_code = correct_code
    end
    empty_count = get_empties()
    black_count = get_black()
    white_count = get_white()
    hint_display = []
    while hint_display.count() < 4
      black_count.times do
        hint_display << @hint_colors[0]
      end
      white_count.times do
        hint_display << @hint_colors[1]
      end
      empty_count.times do
        hint_display << "_"
      end
    end

    @all_hints << hint_display.join(",")
    @all_hints.each do |line|
      puts line
    end
    spaces_filled = @all_hints.length
    (12 - spaces_filled).times do
      puts "_ _ _ _"
    end
  end

  def get_empties()
    empties = 0
    @guess_code.each do |color|
      if(@guess_code.count(color) == 4)
        if(@correct_code.include?(color))
          empties = (@guess_code.count(color) - @correct_code.count(color))
        end
      elsif(@correct_code.include?(color) == false)
        empties += 1
      end
    end
    return empties
  end

  def get_black()
    black_count = 0
    @guess_code.each_with_index do |color, index|
      if(@correct_code.include?(color))
        if(@guess_code[index] == @correct_code[index])
          black_count +=1
        end
      end
    end
    return black_count
  end

  def get_white()
    white_count = 0
    @guess_code.each_with_index do |color, index|
      if( @correct_code.include?(color) && @guess_code.count(color) == 4)
        white_count = 0
        break
      end
      if(@correct_code.include?(color))
        if(@correct_code[index] != @guess_code[index])
            white_count += 1
        end
      else
        next
      end
    end
    return white_count
  end
end