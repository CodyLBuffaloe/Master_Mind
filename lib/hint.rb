require "./colors.rb"
class Hint
  def initialize()
    @guess_code
    @correct_code
    @hint_colors = Colors.new.hint_colors
    @all_hints = []
  end



  def draw_hint_grid(this_guess, correct_code)
    @guess_code = this_guess
    @correct_code = correct_code.split(",")
    hint_display = []
    @correct_code.map!{|x| x.to_sym}
    @guess_code.each_with_index do | color, index |
      if(@correct_code.include?(color) && @guess_code[index] != @correct_code[index])
        hint_display << @hint_colors[1]
      elsif(@guess_code[index] == @correct_code[index])
        hint_display << @hint_colors[0]
      else
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
    puts @all_hints

  end
end