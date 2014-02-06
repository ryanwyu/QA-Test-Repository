#!/usr/local/bin/ruby

module PokerCard
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

  def get_value_type
    
    if has_pairs?
      is_twopair = is_twopair?
      is_threeofkind = is_threeofkind?
      if is_twopair
        if is_threeofkind
          puts "full of house"
        else
          puts "two pair"
        end
      else
        if is_threeofkind
          if is_fourofkind
            puts "four of a kind"
          else
            puts "three of a kind"
          end
        else
          puts "pair"
        end
      end
    else
      is_flush = is_flush?
      is_straight = is_straight?
      if is_flush&&is_straight
        puts "straight flush"
      else  
        puts "flushflag" if is_flush
        puts "straightflag" if is_straight
        if !(is_flush || is_straight)
          puts "High card"
        end
      end
    end
    
  end
  
  

  def sort(cards)
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

  def is_straight?
    straight = false
    if (cards.first - cards.last) == 4 
      #The straight structure except A-5 straight structure
      #puts "A"
      straight = !(has_pairs? || three_of_kind || four_of_kind)
    elsif (cards.first == Card.new(['ace',''])) && (cards.last == Card.new(['two',''])) && ((cards[1]-cards.last) == 3)
      #The A-2-3-4-5 structure
      #puts "B"
      straight = !(has_pairs? || three_of_kind)
    end
    #puts "straight structure:"+straight.to_s
    return straight
  end
  
  def is_flush?
    suited = true
    card = self.cards.first
    size = self.cards.length
    for i in 1..(size-1)
        suited &&= card.suited?(self.cards[i])
    end
      #puts "The compose is flush? #{suited}"
    return suited
  end

  
  def is_twopair?
    
  end
  
end
