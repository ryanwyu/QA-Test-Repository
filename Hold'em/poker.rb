#!/usr/bin/ruby

require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/types.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/card.rb'


class Poker
  attr_accessor :cardset, :length
  
  def initialize
    points = Array(Types::POINTS.keys) 
    types = Array(Types::CARDTYPES.keys)
    @cardset = points.product(types)
    @length = @cardset.length
  end
  
  def collect
    self.initialize
    self.shuffle
  end
    
  def shuffle
    cards = []
    while !@cardset.empty? do
      num = rand(@cardset.length)
      cards.push(@cardset[num])
      @cardset.delete_at(num)
    end
    @cardset = cards
    return @cardset
  end
  
  def deliver
    card = @cardset.shift unless @cardset.empty?
    @length -= 1
    return card
  end
  
end
