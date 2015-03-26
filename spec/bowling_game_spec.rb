#Advanced developers: Uncomment the following to understand more about the RSpec "focus" filter
#require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'bowling_game'

# The top of your testing block
# More examples of tests can be found here: https://github.com/rspec/rspec-expectations
RSpec.describe BowlingGame, "#score" do

  let(:game) { BowlingGame.new }

  it "knows the score is 0 for a new game" do
    expect(game.score).to eql(0)
  end

  it "knows the score is 0 when a finished game has no knocked down" do
    game.roll(0)
    expect(game.score).to eql(0)
  end

  it "knocked down one pin the score is one" do
    game.roll(1)
    expect(game.score).to eql(1)
  end

  it "knocked down 10 pins scores 10" do
    game.roll(10)
    expect(game.score).to eql(10)
  end
  
  it "knocked down a pin twice scores 2" do
   game.roll(1)
   game.roll(1)
   expect(game.score).to eql(2)
  end

  it "knocked down a pin three times scores 3" do
   3.times{game.roll(1)}
   expect(game.score).to eql(3)
  end

 it "rolls an 8, a 2 and a 5 and the score should be 20" do
  game.roll(8)
  game.roll(2)
  game.roll(5)
  expect(game.score).to eql(20)
 end

 it "it rolls 8,2,5,5,5 result is 30" do
  game.roll(8)
  game.roll(2)
  game.roll(5)
  game.roll(5)
  game.roll(5)
  expect(game.score).to eql(35)
 end

  # more tests go here
  it "roles 20 times and asks if game is completed" do
   20.times{game.roll(1)}
   expect(game.completed?).to eql(true)
  end

  it "roles 9 times and asks if game is not completed" do
   9.times{game.roll(1)}
   expect(game.completed?).to eql(false)
  end
end
