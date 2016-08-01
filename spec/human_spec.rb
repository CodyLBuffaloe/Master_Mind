require 'spec_helper'

module MasterMind
  describe Human do
    context "#initialize" do
      name = "Cody"
      player = Human.new(name)
      expect player.name to eq "Cody"
    end
  end
end