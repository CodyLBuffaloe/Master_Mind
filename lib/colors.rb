module MasterMind
  class Colors
    attr_accessor :color_set, :hint_colors

    def initialize
      @color_set = { 1 => :red, 2 => :blue, 3 => :yellow, 4 => :green, 5 => :purple, 6 => :orange}
      @hint_colors = [:black, :white]
    end
  end

end
