require 'colorize'
require 'pry'
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
    conclusion
  end

  # private

  def guess_the_code
    code = cpu_generated_code
    puts code
    until round > 13
      round_output(round)
      input = valid_input?(gets.chomp).to_i
      guess_accuracy(input, code)
      break if game_over?(input, code)


      @round += 1
    end
  end

  def cpu_generated_code
    [rand(1..6), rand(1..6), rand(1..6), rand(1..6)].join.to_i
  end

  def game_over?(input, cipher)
    input == cipher
  end

  def guess_accuracy(input, cipher)
    guess = ['', '', '', '']
    contains_number(input, cipher, guess)
    exact_match?(input, cipher, guess)
    p guess
  end

  def contains_number(input, cipher, guess)
    cipher_split = cipher.to_s.split('')
    input_split = input.to_s.split('')

    cipher_split.each_with_index do |val, idx|
      if input_split.include?(val) && input_split[idx] != val
        input_split.slice!(input.to_s.index(val), 1)
        guess[input_split[idx]] = 'O'
      end
    end

    # input_split.each.with_index do |val, idx|
    #   if cipher_split.include?(val) && cipher_split[idx] != val
    #     cipher_split.slice!(cipher.to_s.index(val), 1)
    #     guess[idx] = 'O'
    #   end
    # end
    # p input_split
    guess
  end

  def exact_match?(input, cipher, guess)
    cipher_split = cipher.to_s.split('')
    input_split = input.to_s.split('')
    input_split.each do |int|
      if cipher_split[0] == int && input_split[0] == int
        guess[0] = 'X'
      end
      if cipher_split[1] == int && input_split[1] == int
        guess[1] = 'X'
      end
      if cipher_split[2] == int && input_split[2] == int
        guess[2] = 'X'
      end
      if cipher_split[3] == int && input_split[3] == int
        guess[3] = 'X'
      end
    end
    guess
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

# for guess_accuracy method
# input_split.each do |i|
#   p cipher.index(i)
#   p input_split.index(i)
#   if cipher.index(i) == input
#     guess[input_split.index(i)] = 'X'
#   elsif cipher.include?(input_split[i])
#     guess[input_split.index(i)] = 'O'
#   else
#     return
#   end
# end