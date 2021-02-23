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

  # private

  def guess_the_code
    code = cpu_generated_code
    until round > 13
      round_output(round)
      input = valid_input?(gets.chomp).to_i
      guess_accuracy(input, code)
      @round += 1
    end
  end

  def cpu_generated_code
    [rand(1..6), rand(1..6), rand(1..6), rand(1..6)].join.to_i
  end

  def game_over?(input, cipher)
    input == cipher
  end

  def guess_accuracy(guess, cipher)
    
  end

  def valid_input?(input)
    if input.to_s.length == 4
      input
    else
      input_error
      input = gets.chomp
      valid_input?(input)
    end
  end
end

game = Mastermind.new
game.guess_the_code


# puts game.guess_accuracy(1234,2245)