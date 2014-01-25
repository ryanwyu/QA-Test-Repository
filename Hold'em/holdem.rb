#!/usr/local/bin/ruby
#/Workshop/freeride/FreeRIDE/freeruby/bin/ruby


#require '/Workshop/workspace/rubyworld/Hold\'em/card.rb'
#require '/Workshop/workspace/rubyworld/Hold\'em/cardcomposition.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/card.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/cardcomposition.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/poker.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/player.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/dealer.rb'

# Main function to calculate the value of 5 cares compositions
#cards = Array.new(5)

#card1 = Card.new('seven', 'heart')
#card2 = Card.new('seven', 'spade')
#card3 = Card.new('five', 'heart')
#card4 = Card.new('four', 'heart')
#card5 = Card.new('three', 'heart')

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

#poker = Poker.new
    
#puts poker.length

#poker.shuffle

#poker.cardset.each {|card| puts card.to_s}

#puts poker.cardset.join(',').to_s #  each {|card| puts card.to_s}

#puts poker.deliver.to_s
players = Array.new(3) {|index| Player.new("Player#{index+1}")}

#Deliver first hand card
#players.each do |player|
#  player.add_card(poker.deliver)
#end ### Why it does not work?


#no = players.length

#for i in 1..(no*2) do
#  j = (i-1)%10
#  card = poker.deliver
#  players[j].add_card(card)
#  puts "Delivered one card #{card.to_s} to #{players[j].name}"
#end

#puts players[9].show_hands
#puts poker.cardset.join(',').to_s #  each {|card| puts card.to_s}

dealer = Dealer.new

dealer.shuffle

puts "=====Card is Ready====="

dealer.deliver_hands(players, 2)
puts "=====Card is delivered====="
players.each do |player|
  puts player.show_hands
end
puts "======================="

puts "====Deliver the community cards===="
community = dealer.deliver_community
#puts community.length

cards = []
puts "We have community cards of "
community.each do |card|
  puts card.show_card
end
puts "======================="

#players.each do |player|
  puts "=== Player's hand ==="
  player = players[0]
  onehand = player.hands
  puts player.show_hands
  
  puts "    === Count card value ==="
  card_group = community+onehand
  cards_composition_ary = (card_group).combination(5).to_a
  
  #cards = cards_compositions.first
  #puts cards.to_s
  max_value = "High Card"
  max_comp = []
  cards_composition_ary.each do |cards_comp_ary|
    #puts cards_compositions.find_index(cards)
    cardcomp = CardComposition.new(cards_comp_ary)
    value = cardcomp.get_value_type
    if CardComposition.compare_value_type(value, max_value) == 1
      max_value = value
      max_comp = cardcomp.cards
    end
    puts "Value is "+cardcomp.valuetype
  end
  
  puts "Player's hand value is "+max_value

#end
