#!/usr/bin/ruby

#require '/Workshop/workspace/rubyworld/Hold\'em/types.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/types.rb'

class Card
  attr_accessor :point, :kind, :type, :value
    
  def initialize(ary=['',''])
    @point = ary[0]
    @type = ary[1]
  end
  
  def <(card)
    if self.compare(card ) < 0
      return true
    else
      return false
    end
  end

  def >(card)
    if self.compare(card ) > 0
      return true
    else
      return false
    end
  end
  
  def ==(card)
    if self.compare(card ) == 0
      return true
    else
      return false
    end
  end
  
  def !=(card)
    if self.compare(card ) != 0
      return true
    else
      return false
    end
  end
  
  def <=>(card)
    return compare(card)
  end
  
  def +(card)
    return (Types::POINTS[@point] + Types::POINTS[card.point])
  end
  
  def -(card)
    #puts "Types::POINTS[card.point]:"+Types::POINTS[card.point].to_s
    #puts "Types::POINTS[@point]:"+Types::POINTS[@point].class.to_s
    numa = Types::POINTS[@point]
    numb = Types::POINTS[card.point]
    #puts numa - numb
    return (numa - numb)
  end
    
  def compare(card)
    return nil if !card
    comp = 0
    #puts "The tracking point: "+card.to_s+"--"+Types::POINTS[card.point].to_s
    if Types::POINTS[@point] < Types::POINTS[card.point] then comp = -1 end
    if Types::POINTS[@point] > Types::POINTS[card.point] then comp = 1 end
    return comp
  end
  
  def suited?(card)
    self.type == card.type
  end
  
  def off_suited?(card)
    !suited?(card)
  end
  
  def to_s
    "[\"#{@point}\",\"#{@type}\"]"
  end

  def self.pairs?(card1, card2)
    return card1 == card2
  end
  
end






