require_relative './display'

class Mastermind
  attr_accessor :round

  def initialize
    @round = 1
  end

  def play_game
    Display.instructions

  end

  def guess_the_code
    code = cpu_generated_code
    until round > 13 
      if round == 12
        puts 'this is your last guess!'
      elsif round == 13 
        puts 'Game over, you lose!'
      else
        puts "round ##{round}"
      end

      @round += 1
    end
  end

  private

  def cpu_generated_code
    [rand(1..6), rand(1..6), rand(1..6), rand(1..6)].join.to_i
  end
end

game = Mastermind.new

game.guess_the_code