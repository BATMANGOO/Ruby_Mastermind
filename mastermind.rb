require_relative './display'

class Mastermind
  include Display
  attr_accessor :round

  def initialize
    @round = 1
  end

  def play_game
    instructions
    guess_the_code
  end

  def guess_the_code
    code = cpu_generated_code
    until round > 13
      round_output(round)
      input = gets.chomp
      puts input
      @round += 1
    end
  end

  private

  def cpu_generated_code
    [rand(1..6), rand(1..6), rand(1..6), rand(1..6)].join.to_i
  end

  def game_over?(input, cipher)
    input == cipher
  end

  def guess_accuracy(guess)

  end
end

game = Mastermind.new

game.play_game