#!/usr/bin/ruby

require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/card.rb'


class Poker
  attr_accessor :count
  
  #cards = []
  
  def initialize
    points = ["ace", "king", "queen", "jack", "ten", "nine", "eight", "seven", "six", "five", "four", "three", "two"]
    types = ["spade", "heart", "club", "diamond"]
    @cards = []
    types.each do |type|
      cardset = points.product(Array.new(1,type))      
      cardset.each do |card|
        @cards << Card.new(card)
      end
    end
    @count = @cards.length
  end
      
  def shuffle
    @cards.shuffle!
  end
  
  def deliver
    if !@cards.empty?
      card = @cards.shift 
      @count = @cards.length
    end
    return card
  end
  
  def empty?
    return @count == 0
  end
  
end
