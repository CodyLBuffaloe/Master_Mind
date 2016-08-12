require "./colors.rb"
class Hint
  def initialize(this_guess, secret_code)
    @single_guess = this_guess.join(",")
    @code_2_match = secret_code
    @hint_colors = Colors.new.hint_colors
    @all_guesses = []
  end

  def provide_hint_grid
    @all_guesses << @single_guess
    @all_guesses.each do |guess|
      puts guess
    end
    spaces_filled = @all_guesses.length
    (12 - spaces_filled).times do
      puts "_ _ _ _"
    end

  end
end