require "./colors.rb"

class Hint
  def initialize()
    @hint_colors = Colors.new.hint_colors
    @all_hints = []
    @color_list = [:red, :blue, :yellow, :green , :purple, :orange]
  end



#for each color in guess_code, find how many times it occurs
#then how many times it occurs in correct_code
#only return white markers for the frequency of color
#appearences in correct_code

  def draw_hint_grid(this_guess, correct_code)
    guess_code = this_guess
    if(correct_code.class != Array)
      correct_code = correct_code.split(",")
      correct_code.map!{|x| x.to_sym}
    else
      correct_code = correct_code
    end

    black_count = get_black(guess_code, correct_code)
    white_count = get_white(guess_code, correct_code, black_count)
    empty_count = get_empties(guess_code, correct_code, black_count, white_count)
    hint_display = []

      black_count.times do
        hint_display << @hint_colors[0]
      end
      white_count.times do
        hint_display << @hint_colors[1]
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
  end



  def get_black(guess_code, correct_code)
    black_count = 0
    guess_code.each_with_index do |color, index|
      if(correct_code.include?(color))
        if(guess_code[index] == correct_code[index])
            black_count +=1
        end
      end
    end
    return black_count
  end

  def get_white(guess_code, correct_code, black_count)
    white_count = 0
    match_count = 0
    @color_list.each do |color|
      guess_count = guess_code.count(color)
      code_count = correct_code.count(color)
      if(guess_count >= code_count)
        match_count += code_count
      elsif(guess_count < code_count)
        match_count += guess_count
      end
    end
    white_count = (match_count - black_count)
    return white_count
  end
  def get_empties(guess_code, correct_code, black_count, white_count)
    empties = 0
    empties = 4 - (white_count + black_count)
    return empties
  end
end