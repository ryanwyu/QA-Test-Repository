#!/usr/bin/ruby

class Card
  attr_accessor :type, :value, :kind

  POINTS = {
  "ace" => 14,
  "king" => 13,
  'queen' => 12,
  'jack' => 11,
  'ten' => 10,
  'nine' => 9,
  'eight' => 8,
  'seven' => 7,
  'six' => 6,
  'five' => 5,
  'four' => 4,
  'three' => 3,
  'two' => 2,
  'one' => 1,
  '' => 0
  }
  
  CARDTYPES = {
    'spade' => 4,
    'heart' => 3,
    'club' => 2,
    'diamond' => 1,
    '' => 0
  }
    
  def point
    return @kind
  end
  
  def value
    return POINTS[@kind]
  end
    
  def initialize(ary=['', ''])
    @kind = ary[0]
    @type = ary[1]
    @value = POINTS[@kind]
  end
  
  def <(card)
    if compare(card ) < 0
      return true
    else
      return false
    end
  end

  def >(card)
    if compare(card ) > 0
      return true
    else
      return false
    end
  end
  
  def ==(card)
    if compare(card ) == 0
      return true
    else
      return false
    end
  end
  
  def !=(card)
    if compare(card ) != 0
      return true
    else
      return false
    end
  end
  
  def <=>(card)
    return compare(card)
  end
  
  def +(card)
    return (Types::POINTS[@kind] + Types::POINTS[card.point])
  end
  
  def -(card)
    #puts "Types::POINTS[card.point]:"+Types::POINTS[card.point].to_s
    #puts "Types::POINTS[@kind]:"+Types::POINTS[@kind].class.to_s
    numa = POINTS[@kind]
    numb = POINTS[card.point]
    #puts numa - numb
    return (numa - numb)
  end
    
  def same?(card)
    return self == card && suited?(card)
  end
  
  def suited?(card)
    return self.type == card.type
  end
  
  def off_suited?(card)
    return !suited?(card)
  end
  
  def show_card
    return "[#{@kind},#{@type}]"
  end

  def self.pairs?(card1, card2)
    return card1 == card2
  end
  
  private
  
  def compare(card)
    return nil if !card
    comp = 0
    #puts "The tracking point: "+card.to_s+"--"+Types::POINTS[card.point].to_s
    if POINTS[@kind] < POINTS[card.point] then comp = -1 end
    if POINTS[@kind] > POINTS[card.point] then comp = 1 end
    return comp
  end

end






