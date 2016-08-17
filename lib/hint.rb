require "./colors.rb"
class Hint
  def initialize(this_guess, correct_code)
    @guess_code = this_guess
    @correct_code = correct_code.split(",")
    @hint_colors = Colors.new.hint_colors
    @all_hints = []
    @hint_display = []
  end



  def draw_hint_grid()
    @guess_code.each_with_index do | color, index |
      if(@guess_code[index] == @correct_code[index].to_sym)
        @hint_display << :black
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
end