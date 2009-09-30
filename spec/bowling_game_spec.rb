require File.dirname(__FILE__) + '/spec_helper'
require 'bowling_game'

describe BowlingGame do
  before(:each) do
    @game = BowlingGame.new
  end

  it "should calculate a gutter game score" do
    roll_many(20, 0)
    @game.score.should == 0
  end

  it "should calculate a all ones score" do
    roll_many(20, 1)
    @game.score.should == 20
  end

  it "should calculate a one spare score" do
    roll_spare
    @game.roll(3)
    roll_many(17, 0)

    @game.score.should == 16
  end

  it "should calculate a strike score" do
    roll_strike # strike
    @game.roll(3)
    @game.roll(4)
    roll_many(16, 0)

    @game.score.should == 24
  end

  it "should calculate a perfect game score" do
    roll_many(12, 10)

    @game.score.should == 300
  end

  def roll_many(n, pins)
    0.upto(n - 1) { |i| @game.roll(pins) }
  end

  def roll_spare
    @game.roll(5)
    @game.roll(5)
  end

  def roll_strike
    @game.roll(10)
  end
end
