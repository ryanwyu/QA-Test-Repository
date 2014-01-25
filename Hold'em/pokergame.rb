#!/usr/bin/ruby

class PokerGame
  attr_accessor :bb, :sb, :ante, :gametype
  
  # Key elements:
  # Game: game type, blind mount,
  # Players
  # Playround
  # Bet and Pot
  
  
  def initialize(gametype, dealername)
    @gametype = gametype
    @dealer = Dealer.new(dealername)
    @position = Array.new(10)
    @sb = 1
    @bb = @sb * 2
    @ante = 0
  end
  
  def sit_down(player, pos = nil)
  end
  
  def stand_up(player)
  end
  
  def start
  end
  
  
  
end

