require "./colors.rb"
class Hint
  def initialize(this_guess, secret_code)
    @single_guess = this_guess
    @code_2_match = secret_code
    @hint_colors = Colors.new.hint_colors
    @all_hints = []
    @hint_display = []
  end



  def draw_hint_grid
    @single_guess.each_with_index do | color, index |
      @single_guess[index] = @single_guess[index].to_sym
      if(@single_guess[index] == @code_2_match[index])
        @hint_display << hint_colors[0]
      end
    end
    @all_hints << @hint_display
    @all_hints.each do |hint|
      puts hint
    end
    spaces_filled = @all_hints.length
    (12 - spaces_filled).times do
      puts "_ _ _ _"
    end

  end
end