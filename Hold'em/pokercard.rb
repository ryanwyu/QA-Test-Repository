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
  
    debug = ''#nil
    if debug
      puts "=== in sort ==="
      temp_cards.each do |card|
        puts card.show_card
      end
    end
  
    dup_cards = []
    cards.each do |card|
      dup_count = temp_cards.count(card)
      puts "\nwe got #{dup_count} #{card.point}"+ " #{card.class}" if debug
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
      puts "  the dup cards: " + dup_cards.to_s if debug
      puts "  left: "+ temp_cards.to_s if debug
    end
    puts "reach here:" + dup_cards.to_s if debug
    cards = dup_cards + temp_cards
    puts "We final got :" + cards.to_s + "\n" if debug
    return cards
  
  end
  
end
