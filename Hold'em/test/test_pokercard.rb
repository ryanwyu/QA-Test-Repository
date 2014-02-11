#!/usr/local/bin/ruby

require 'test/unit'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/pokercard.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/card.rb'
require '/Workshop/workspace/GITRep/github/rep1/QA-Test-Repository/Hold\'em/cardcomposition.rb'

class TestPokercard < Test::Unit::TestCase
  
    Cardary_s = []; type = 'spade'
    Card::POINTS.to_a.reverse.each do |point, value|
    	#puts point
    	Cardary_s << Card.new([point, type])
    end
    	
    Cardary_h = []; type = 'heart'
    Card::POINTS.to_a.reverse.each do |point, value|
    	Cardary_h << Card.new([point, type])
    end
    	
    Cardary_d = []; type = 'diamond'
    Card::POINTS.to_a.reverse.each do |point, value|
    	Cardary_d << Card.new([point, type])
    end
    	
    Cardary_c = []; type = 'club'
    Card::POINTS.to_a.reverse.each do |point, value|
    	Cardary_c << Card.new([point, type])
    end
    	
  def test_is_flush_staight
        
    cardcomp1 = CardComposition.new([Cardary_s[6], Cardary_s[5], Cardary_s[4], Cardary_s[3], Cardary_s[7]])
    cardcomp2 = CardComposition.new([Cardary_d[11], Cardary_d[13], Cardary_d[14], Cardary_d[12], Cardary_d[10]])
    
    assert_equal("Flush Straight", cardcomp1.set_value_type, "It should be Flush Straight")
    assert_equal("Flush Straight", cardcomp2.set_value_type, "It should be Loyal Flush Straight")
    
  end

  def test_is_four_kind
        
    cardcomp1 = CardComposition.new([Cardary_s[9], Cardary_h[9], Cardary_d[9], Cardary_c[9], Cardary_c[7]])
    
    assert_equal("Four Kinds", cardcomp1.set_value_type, "It should be Four of a kind 9")
    
  end

  def test_is_full_house
    cardcomp1 = CardComposition.new([Cardary_s[2], Cardary_h[2], Cardary_d[8], Cardary_c[2], Cardary_h[8]])
    cardcomp2 = CardComposition.new([Cardary_s[2], Cardary_h[2], Cardary_d[8], Cardary_c[2], Cardary_h[7]])
    
    assert_equal("Full House", cardcomp1.set_value_type, "Should be full of house of 2 with 8")
    assert_equal("Three Kinds", cardcomp2.set_value_type, "Should be three of a kind of 2")
  	
  end

  def test_is_straight
        
    cardcomp1 = CardComposition.new([Cardary_s[2], Cardary_s[6], Cardary_d[5], Cardary_c[4], Cardary_h[3]])
    cardcomp2 = CardComposition.new([Cardary_s[1], Cardary_s[3], Cardary_s[4], Cardary_h[7], Cardary_s[7]])
    cardcomp3 = CardComposition.new([Cardary_s[1], Cardary_s[2], Cardary_d[5], Cardary_c[4], Cardary_h[3]])
    
    assert_equal("Straight", cardcomp1.set_value_type, "normal straight: 2-3-4-5-6")
    assert_not_equal("Straight", cardcomp2.set_value_type, "This card composition should not be straight")
    assert_equal("Straight", cardcomp3.set_value_type, "Straight with A: A-2-3-4-5")    
    
  end
  
  def test_is_pair
    
    
    cardcomp1 = CardComposition.new([Cardary_s[2], Cardary_s[7], Cardary_d[8], Cardary_c[2], Cardary_h[7]])
    cardcomp2 = CardComposition.new([Cardary_s[1], Cardary_s[3], Cardary_s[4], Cardary_h[7], Cardary_s[7]])
    
    assert_equal("Two Pair", cardcomp1.set_value_type, "It should be two pairs")
    assert_equal("Pair", cardcomp2.set_value_type, "It should be pair")
    
  end
  
end
