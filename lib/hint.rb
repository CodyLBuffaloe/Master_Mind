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
    @correct_code = correct_code.split(",")
    @correct_code.map!{|x| x.to_sym}
    empty_count = get_empties()
    black_count = get_black()
    white_count = get_white()
    hint_display = []
    puts "BC"
    puts black_count
    puts "WC"
    puts white_count

      black_count.times do
        hint_display << @hint_colors[0]
      end
      if(white_count > black_count)
        (white_count - black_count).times do
          hint_display << @hint_colors[1]
        end
      else
        white_count.times do
          hint_display << @hint_colors[1]
        end
      end
      empty_count.times do
        hint_display << "_"
      end

    @all_hints << hint_display.join(",")
    @all_hints.each do |line|
      puts line
    end
    spaces_filled = @all_hints.length
    (12 - spaces_filled).times do
      puts "_ _ _ _"
    end
    puts black_count
    puts white_count
    puts empty_count
  end

  def get_empties()
    empties = 0
    @guess_code.each do |color|
      if(!@correct_code.include?(color))
        empties += 1
      end
    end
    return empties
  end

  def get_black()
    black_count = 0
    @guess_code.each_with_index do |color, index|
      if(@correct_code.include?(color) && @guess_code[index] == @correct_code[index])
        black_count +=1
      end
    end
    return black_count
  end

  def get_white()
    white_count = 0
    @guess_code.each_with_index do |color, index|
      if(@correct_code.include?(color) && @correct_code[index] != @guess_code[index] )
        if(@guess_code.count(color) > @correct_code.count(color))
          white_count += @correct_code.count(color)
        else
          white_count += @guess_code.count(color)
        end
      else
        return 0
      end
    end
    return white_count
  end
end