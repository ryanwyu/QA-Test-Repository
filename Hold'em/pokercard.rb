#!/usr/local/bin/ruby

module PokerCardValue
# This is used for poker game
# This module provides basic methods used for poker game calculation

  valuetype = "High Card"
  typeflag = {}
  
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

  def get_value_type(cards = self.cards)
    
    valuetype = "High Card"
    cards = sort(cards)
    
    first_occurrance = cards.count(cards.first)
    
    if first_occurrance > 1
      
      valuetype = "Pair"      
      second_occurrance = cards.count(cards[first_occurrance])
      
      if first_occurrance == 3
        if second_occurrance > 1
          valuetype = "Full House"
        else
          valuetype = "Three Kinds"
        end
      else
        if second_occurrance > 1
          valuetype = "Two Pair"
        end
      end      
      if first_occurrance == 4
        valuetype = "Four Kinds"  
      end  

    else

      is_flush = is_flush?(cards)
      is_straight = is_straight?(cards)

      if is_flush&&is_straight
        valuetype = "Flush Straight"
      else
        valuetype = "Flush" if is_flush
        valuetype = "Straight" if is_straight
      end    

    end
    
    return valuetype
    
  end
  
  

  def sort(cards = self.cards)
    #Order the cords by card structure
    temp_cards = cards.sort!.reverse!.map.to_a

    #DEBUG BEGIN  
    debug = nil
    if debug
      puts "=== in sort ==="
      temp_cards.each do |card|
        puts card.show_card
      end
    end
    #Debug END
  
    dup_cards = []
    cards.each do |card|
      dup_count = temp_cards.count(card)
      puts "\nwe got #{dup_count} #{card.point}"+ " #{card.class}" if debug   #DEBUG
      if dup_count > 1          
        while indx = temp_cards.find_index(card) do
          tc = temp_cards[indx]
          if dup_count > 2
            #put the dup card before the list
            dup_cards.unshift(tc)
          else
            dup_cards << tc
          end
          temp_cards.delete_at(indx)
        end
      end
      puts "  the dup cards: " + dup_cards.to_s if debug   #DEBUG
      puts "  left: "+ temp_cards.to_s if debug   #DEBUG
    end
    puts "reach here:" + dup_cards.to_s if debug   #DEBUG
    cards = dup_cards + temp_cards
    puts "We final got :" + cards.to_s + "\n" if debug   #DEBUG
    return cards
  
  end

  def is_straight?(cards = self.cards)

    straight = false
    
    straight ||= (cards.count(cards.first) == 1) && (((cards.first - cards.last) == 4 ) || (cards.first == Card.new(['ace',''])) && (cards.last == Card.new(['two',''])) && ((cards[1]-cards.last) == 3))

    return straight
  
  end
  
  def is_flush?(cards=self.cards)

    suited = true
    card = self.cards.first
    size = self.cards.length

    for i in 1..(size-1)
        suited &&= card.suited?(self.cards[i])
    end

    return suited

  end
  
end
