#!/usr/local/bin/ruby

require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/card.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/cardcomposition.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/poker.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/player.rb'

class Dealer
  attr_accessor :name
  
  def initialize(name='')
    @name = name
    @poker = Poker.new
  end
  
  def collect
    @poker = Poker.new
  end
  
  def shuffle(num=1)
    num.to_i.times {@poker.shuffle}
  end
  
  def deliver_card(count)
    if !@poker.empty?
      return @poker.deliver(count)
    end
  end
  
  def deliver_hands(players, count_per_hand, position_after=0)
    #'after' means the how many positions afer the first one to deliver first
    p_no = players.length

    #Deliver cards to players in turn with number of cards specified in $size
    for i in 1..(p_no*count_per_hand) do
      j = (i-1+position_after) % players.count
      if players[j] != nil
        card = @poker.deliver
        players[j].receive_card(card) if card
        #puts "Delivered one card #{card.to_s} to #{players[j].name}"
      end
    end
            
  end
  
  def deliver_community
    community = []
    community += deliver_flop
    community += deliver_turn
    community += deliver_river
    if community.length == 5
      return community
    end
  end
  
  def deliver_flop
    flop = []
    if @poker.deliver # Deliver 1 wash card
      3.times {flop << @poker.deliver}
    end
    return flop
  end
  
  def deliver_turn
    turn = []
    if @poker.deliver # Deliver 1 wash card
      turn << @poker.deliver
    end
    return turn
  end
  
  def deliver_river
    river = []
    if @poker.deliver # Deliver 1 wash card
      river << @poker.deliver
    end
    return river
  end
  
  def move_button
  end
  
end
