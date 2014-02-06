#!/usr/bin/ruby

require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/card.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/pokercard.rb'

  VALUETYPES = {
    'Loyal Flush Straight'=>10,
    'Flush Straight' => 9,
    'Four Kinds' => 8,
    'Full House' => 7,
    'Flush' => 6,
    'Straight' =>5,
    'Three Kinds' => 4,
    'Two Pair' => 3,
    'Pair' => 2,
    'High Card' => 1,
    'default' => 0
    }


class CardComposition
  
  include PokerCardValue
  
  attr_accessor :valuetype, :value
  attr_reader :size, :cards
    
  def initialize(cards_ary)
    #get all 5 cards in an array @cards = [cards[0], cards[1], cards[2], cards[3], cards[4]]
    if cards_ary.length >= 5
      @cards = cards_ary.first(5)
    else
      puts "Error when initialization!"
      @cards = Array.new(5) {Card.new}
    end
    #@cards = order_by_point(cards_ary)
    #@valuetype = 'default'
    sort()
  end

  def to_s
    s = "Cards Composition: "
    @cards.each {|card| s += " "+card.show_card}
    return s
  end
  
  def set_value_type
    @valuetype = get_value_type(cards)
  end
  
  
  def self.compare_value_type(valuetype1, valuetype2)
    return VALUETYPES[valuetype1] <=> VALUETYPES[valuetype2]
  end

  private
  
  def self.count_of_kind(cards, count)
    cards.each do |card|
      if cards.count(card) == count
        yield card
      end
    end
    return
  end
    
end
