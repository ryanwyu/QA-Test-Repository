#!/usr/bin/ruby

class Player
  attr_accessor :name, :hands
  
  def initialize(name='')
    @name = name
    @hands = []
  end
  
  def add_card(card)
    if card
      @hands << card
    end
    
  end
  
  def show_hands
    hand = ''
    @hands.each do |card|
      hand += card.to_s
    end
    
    return @name + " has #{@hands.length} cards:" + hand
  end
  
  def hand_value(community)
  end
  
end
