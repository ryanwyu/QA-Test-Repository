#!/usr/bin/ruby
#/Workshop/freeride/FreeRIDE/freeruby/bin/ruby


#require '/Workshop/workspace/rubyworld/Hold\'em/card.rb'
#require '/Workshop/workspace/rubyworld/Hold\'em/cardcomposition.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/card.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/cardcomposition.rb'

# Main function to calculate the value of 5 cares compositions
#cards = Array.new(5)

card1 = Card.new('seven', 'heart')
card2 = Card.new('seven', 'spade')
card3 = Card.new('five', 'heart')
card4 = Card.new('four', 'heart')
card5 = Card.new('three', 'heart')

#cards = Array[card1, card2, card3, card4, card5]
#cards = [7,6,5,4,5,1,3,2,1,2,3,4,5]
#cards = ["a", "b", "1", "2", "3", "5"]


#cardcomp = CardComposition.new(cards, 5)
  
#cardcomp.sort

#puts "Pairs?:" + cardcomp.has_pairs?.to_s
#puts "Paris: " + cardcomp.pairs.to_s
#card = cardcomp.four_of_kind
#card = cardcomp.pairs
#card = cardcomp.is_straight?
#card = cardcomp.full_of_house
#valuetype = cardcomp.valuetype
#    puts "The #{cardcomp.size} cards' value is counted: #{valuetype}!"

#puts card.size
#puts card3 - card2
#puts "Four of a kind: " + cardcomp.four_of_kind.point

