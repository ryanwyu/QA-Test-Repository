#!/usr/bin/ruby

require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/card.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/types.rb'

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
  end

  def to_s
    s = "Cards Composition: "
    @cards.each {|card| s += " "+card.to_s}
    return s
  end

  def get_value_type
        
    self.sort
    #Chech the four of kind value
    if four_of_kind
      @valuetype = 'Four kinds'
      return @valuetype
    end

    
    if full_of_house
      @valuetype = 'Full House'
      return @valuetype
    elsif three_of_kind
      @valuetype = 'Three Kinds'
      return @valuetype
    end
        
    if is_straight?
      if is_flush?
        if @cards.last == Card.new('ten')
          @valuetype = 'Loyal Flush Straight'
      return @valuetype
        else
          @valuetype = 'Flush Straight'
          return @valuetype
        end
      else
        @valuetype = 'Straight'
        return @valuetype
      end
    elsif is_flush?
      @valuetype = 'Flush'
      return @valuetype
    elsif has_pairs?
      pair_size = get_pairs.size
      if pair_size == 2
        @valuetype = "Two Pair"
      else
        @valuetype = 'Pair'
      end
      return @valuetype
    else
      @valuetype = 'High Card'
      return @valuetype
    end
  
    #puts "The #{@size} cards' value is counted: #{@valuetype}!"
    return @valuetype
  end
  
  def sort
    @cards = order_by_point(@cards)
  end
  
  def has_pairs?
    @cards.each do |card1|
      #puts "outer loop: #{card1.to_s}:"
      return true if @cards.count(card1) == 2
    end
    return false
  end
  
  def get_pairs
    pairs = []
    temp_cards = @cards.map.to_a
    while temp_cards.size > 1 do
      temp_card = temp_cards.first
      if temp_cards.count(temp_card) == 2
        pairs << temp_cards.first
      end
      
      temp_cards.delete(temp_card)  
      
    end
    
    return pairs
    
  end
  
  def old_pairs
    temp_pairs = []
    cards_to_compare = @cards
    CardComposition::count_of_kind(cards_to_compare, 2) {|card| temp_pairs << card if !temp_pairs.include?(card)}
    #@cards.each do |card|
    #  if pair_in?(card, cards_to_compare)
    #    temp_pairs << card 
    #    cards_to_compare.delete(card)
    #  end         
    #end
  
      #CardComposition::count_of_kind(@cards, 2) {|card| temp_pairs.append(card); cards_to_compare.delete(card)}
  
    
    #DEBUG      
    puts "#{pairs.size} Pair(s):"
    if temp_pairs.size > 0
      temp_pairs.each {|card| puts "Card"+card.to_s}
    else
      puts "None"
    end
    #DEBUG END
    
    if temp_pairs.size > 0 
      return temp_pairs
    else
      return nil
    end
  end
  
  def pair_in?(card, cards)
      return cards.count(card) == 2
  end

  def is_straight?
    straight = false
    if (@cards.first - @cards.last) == 4 
      #The straight structure except A-5 straight structure
      #puts "A"
      straight = !(has_pairs? || three_of_kind || four_of_kind)
    elsif (@cards.first == Card.new(['ace',''])) && (@cards.last == Card.new(['two',''])) && ((@cards[1]-@cards.last) == 3)
      #The A-2-3-4-5 structure
      #puts "B"
      straight = !(has_pairs? || three_of_kind)
    end
    #puts "straight structure:"+straight.to_s
    return straight
  end
  
  def is_flush?
    suited = true
    card = @cards.first
    size = @cards.length
    for i in 1..(size-1)
        suited &&= card.suited?(@cards[i])
    end
      #puts "The compose is flush? #{suited}"
    return suited
  end
  
  def three_of_kind
    c = nil
    CardComposition::count_of_kind(@cards, 3) {|card| puts card; c = card}
      
    #debug = ''
    if defined?(debug)
    puts "Three of a kind: "
    if c
      puts c.point
    else
      puts "None"
    end
    end
    
    return c
  end
  
  def four_of_kind
    c = nil
    CardComposition::count_of_kind(@cards, 4) {|card| c = card}

    #debug = ""
    if defined?(debug)      
    puts "Four of a kind: "
    if c
      puts c.point
    else
      puts "None"
    end
    end

    return c
  end
  
  def full_of_house
    f = self.three_of_kind
    h = has_pairs?
    if f && h
      #debug = ""
      if defined?(debug)
      puts "We got full of house:"
      puts "#{f.point}"
      #puts "#{h.first.point}"
      end
      return f
    end
    return nil
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
  
  def order_by_point(cards)
    #Order the cords by card point like this: A-K-Q-J-T-9-8-7-6-5-4-3-2-1
    temp_cards = []
    size = cards.size
    if size > 0
      temp_cards.push(@cards[0])
      i=1
      while i < size do
        j = i
        while cards[i] > temp_cards[j-1] && j > 0 do
          j = j - 1
        end
        temp_cards.insert(j, cards[i])
        i += 1
      end
    end
    return temp_cards
  end  
  

  def compare
  end

end
