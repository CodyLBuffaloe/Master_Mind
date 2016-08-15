require "./colors.rb"
class Hint
  def initialize(this_guess, secret_code)
    @single_guess = this_guess.join(",")
    @code_2_match = secret_code
    @hint_colors = Colors.new.hint_colors
    @all_hints = []
    @hint_display = []
  end

  def indicate(single_guess, hint_colors, code_2_match)
    single_guess.each_with_index do | color, index |
      if(single_guess[index] == code_2_match[index])
        @hint_display << hint_colors[0]
      end
    end
  end

  def draw_hint_grid
    @all_hints << @hint_display
    @all_hints.each_with_index do |hint|
      puts hint
      puts 
    end
    spaces_filled = @hint_display.length
    (12 - spaces_filled).times do
      puts "_ _ _ _"
    end

  end
end