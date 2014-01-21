#!/usr/bin/ruby

require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/card.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/cardcomposition.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/poker.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/player.rb'

class Dealer
  attr_accessor :name, :poker
  
  def initialize(name='')
    @name = name
    @poker = Poker.new
  end
  
  def shuffle(num=1)
    num.to_i.times { poker.shuffle }  
  end
  
  def deliver_hands(players, size, after=0)
    #'after' means the how many positions afer the first one to deliver first
    p_no = players.length
    
    #Deliver cards to players in turn with number of cards specified in $size
    for i in 1..(p_no*size) do
      j = (i-1+after) % players.count
      card = poker.deliver
      players[j].add_card(card)
      #puts "Delivered one card #{card.to_s} to #{players[j].name}"
    end
    
    return players
    
  end
  
  def deliver_community
    community = []
    self.deliver_flop(community)
    self.deliver_turn(community)
    self.deliver_river(community)
    return community
  end
  
  def deliver_flop(community)
    #Deliver 1 wash card
    poker.deliver
    
    #Deliver 3 flop cards
    for i in 1..3
      community << poker.deliver
    end
  end
  
  def deliver_turn(community)
    #Deliver 1 wash card
    poker.deliver
    
    #Deliver 1 flop cards
      community << poker.deliver
  end
  
  def deliver_river(community)
    #Deliver 1 wash card
    poker.deliver
    
    #Deliver the river cards
      community << poker.deliver
  end
  
  def move_button
  end
  
end
