require "./colors.rb"
class Hint
  def initialize()
    @guess_code
    @correct_code
    @hint_colors = Colors.new.hint_colors
    @all_hints = []
    @hint_display = []
  end



#for each color in guess_code, find how many times it occurs
#then how many times it occurs in correct_code
#only return white markers for the frequency of color
#appearences in correct_code

  def draw_hint_grid(this_guess, correct_code)
    @guess_code = this_guess
    @correct_code = correct_code.split(",")
    @correct_code.map!{|x| x.to_sym}
    black_count = get_black()
    @correct_code.each_with_index do | color, index |
      if(@correct_code.include?(color) && @guess_code[index] != @correct_code[index])
          @hint_display << @hint_colors[1]
      else
        @hint_display << "_"
      end
    end
    @all_hints << @hint_display.join(",")
    @all_hints.each do |line|
      puts line
    end
    spaces_filled = @all_hints.length
    (12 - spaces_filled).times do
      puts "_ _ _ _"
    end
  end

  def get_black()
    @correct_code.each_index do |index|
      if(@guess_code[index] == @correct_code[index])
        @hint_display << @hint_colors[0]
      end
    end
  end

  def get_white()
    @guess_code.each do |color|
      guess_color_count = @guess_code.count(color)
      correct_color_count = @correct_code.count(color)
      if(guess_color_count >= correct_color_count)
         (correct_color_count).times do
           @hint_display << @hint_colors[1]
         end
      else
         (guess_color_count).times do
           @hint_display << @hint_colors[1]
         end
      end
    end

  end
end