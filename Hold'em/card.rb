#!/usr/bin/ruby

#require '/Workshop/workspace/rubyworld/Hold\'em/types.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/types.rb'

class Card
  attr_accessor :point, :type, :value
  
  def initialize(point, type='')
    @point = point
    @type = type
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
  
  def +(card)
    return (Types::POINTS[@point] + Types::POINTS[card.point])
  end
  
  def -(card)
    return (Types::POINTS[@point] - Types::POINTS[card.point])
  end
    
  def compare(card)
    comp = 0
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
    "<#{@point},#{@type}>"
  end

  def self.pairs?(card1, card2)
    return card1 == card2
  end
  
end






