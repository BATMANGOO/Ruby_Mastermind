require_relative './display'
class Mastermind
  attr_accessor :rounds

  def initialize
    @rounds = 12
  end

  def play_game
    Display.instructions

  end

  def guess_the_code
    code = cpu_generated_code
    
  end

  private

  def cpu_generated_code
    [rand(1..6), rand(1..6), rand(1..6), rand(1..6)].join.to_i
  end
end

game = Mastermind.new

game.guess_the_code