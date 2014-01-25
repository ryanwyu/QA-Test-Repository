#!/usr/bin/ruby

class Player
  attr_accessor :name, :hands
  
  def initialize(name='')
    @name = name
    @hands = []
  end
  
  def receive_card(card)
    if card
      @hands << card
    end
    
  end
  
  def show_hands
    hand = "#{@name} has #{@hands.length} cards:"
    @hands.each do |card|
      hand += card.show_card
    end    
    return hand
  end
  
  def hand_value(community)
  end
  
  def bet
  end
  
end
