#!/usr/bin/ruby

require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/types.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/card.rb'


class Poker
  attr_accessor :cardset
  
  def initialize()
    points = Array(Types::POINTS.keys) 
    types = Array(Types::CARDTYPES.keys)
    @cardset = points.product(types)
  end
  
  def length
    return @cardset.length
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
end


poker = Poker.new
    
puts poker.length

puts poker.shuffle.class

#poker.cardset.each {|card| puts card.to_s}

puts poker.cardset.join(',').to_s #  each {|card| puts card.to_s}