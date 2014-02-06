#!/usr/local/bin/ruby

require 'test/unit'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/pokercard.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/card.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/cardcomposition.rb'

class TestPokercard < Test::Unit::TestCase
  
    type = 'space'
    Cardary_s = ["spade cards", Card.new(['ace', type]), Card.new(['two', type]), Card.new(['three', type]), Card.new(['four', type]), Card.new(['five', type]), Card.new(['six',type]), Card.new(['seven',type]), Card.new(['eight',type]), Card.new(['nine',type]), Card.new(['ten',type]), Card.new(['jack',type]), Card.new(['queen',type]), Card.new(['king',type])]
        
    type = 'heart'
    Cardary_h = ["heart cards", Card.new(['ace', type]), Card.new(['two', type]), Card.new(['three', type]), Card.new(['four', type]), Card.new(['five', type]), Card.new(['six',type]), Card.new(['seven',type]), Card.new(['eight',type]), Card.new(['nine',type]), Card.new(['ten',type]), Card.new(['jack',type]), Card.new(['queen',type]), Card.new(['king',type])]
    
    type = 'diamond'
    Cardary_d = ["diamond cards", Card.new(['ace', type]), Card.new(['two', type]), Card.new(['three', type]), Card.new(['four', type]), Card.new(['five', type]), Card.new(['six',type]), Card.new(['seven',type]), Card.new(['eight',type]), Card.new(['nine',type]), Card.new(['ten',type]), Card.new(['jack',type]), Card.new(['queen',type]), Card.new(['king',type])]
    
    type = 'club'
    Cardary_c = ["club cards", Card.new(['ace', type]), Card.new(['two', type]), Card.new(['three', type]), Card.new(['four', type]), Card.new(['five', type]), Card.new(['six',type]), Card.new(['seven',type]), Card.new(['eight',type]), Card.new(['nine',type]), Card.new(['ten',type]), Card.new(['jack',type]), Card.new(['queen',type]), Card.new(['king',type])]

  def test_is_twopair
    
    
    cardcomp1 = CardComposition.new([TestPokercard::Cardary_s[2], TestPokercard::Cardary_s[7], TestPokercard::Cardary_d[8], TestPokercard::Cardary_c[2], TestPokercard::Cardary_h[7]])
    cardcomp2 = CardComposition.new([TestPokercard::Cardary_s[1], TestPokercard::Cardary_s[3], TestPokercard::Cardary_s[4], TestPokercard::Cardary_h[7], TestPokercard::Cardary_s[7]])
    
    assert_equal("Two Pair", cardcomp1.set_value_type)
    assert_not_equal("Two Pair", cardcomp2.set_value_type)
    
  end
  
  def test_is_straight
        
    cardcomp1 = CardComposition.new([TestPokercard::Cardary_s[2], TestPokercard::Cardary_s[6], TestPokercard::Cardary_d[5], TestPokercard::Cardary_c[4], TestPokercard::Cardary_h[3]])
    cardcomp2 = CardComposition.new([TestPokercard::Cardary_s[1], TestPokercard::Cardary_s[3], TestPokercard::Cardary_s[4], TestPokercard::Cardary_h[7], TestPokercard::Cardary_s[7]])
    cardcomp3 = CardComposition.new([TestPokercard::Cardary_s[1], TestPokercard::Cardary_s[2], TestPokercard::Cardary_d[5], TestPokercard::Cardary_c[4], TestPokercard::Cardary_h[3]])
    
    assert_equal("Straight", cardcomp1.set_value_type)
    assert_not_equal("Straight", cardcomp2.set_value_type)
    assert_equal("Straight", cardcomp3.set_value_type)    
    
  end
  
  
end
