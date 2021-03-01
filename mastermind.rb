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
    play_again
  end

  private

  def guess_the_code
    code = cpu_generated_code
    until round > 12
      round_output(round)
      input = valid_input?(gets.chomp).to_i
      guess_accuracy(input, code)
      break if game_over?(input, code)

      @round += 1
    end
    puts win_or_loss(game_over?(input, code))
  end

  def cpu_generated_code
    [rand(1..6), rand(1..6), rand(1..6), rand(1..6)].join.to_i
  end

  def game_over?(input, cipher)
    input == cipher
  end

  def guess_accuracy(input, cipher)
    cipher_split = cipher.to_s.split('')
    input_split = input.to_s.split('')
    show_clues(exact_match?(input_split, cipher_split), contains_number(input_split, cipher_split))
  end

  def show_clues(exact, same)
    print 'Clues: '
    exact.times { print 'X'.blue }
    same.times { print 'O'.yellow }
    puts ''
  end

  def contains_number(input_split, cipher_split)
    same = 0

    input_split.each_index do |idx|
      next unless input_split[idx] != 'X' && cipher_split.include?(input_split[idx])

      same += 1
      remove = cipher_split.find_index(input_split[idx])
      cipher_split[remove] = 'O'
      input_split[idx] = 'O'
    end
    same
  end

  def exact_match?(input_split, cipher_split)
    exact = 0

    cipher_split.each_with_index do |val, idx|
      next unless val == input_split[idx]

      exact += 1
      cipher_split[idx] = 'X'
      input_split[idx] = 'X'
    end
    exact
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

  def play_again
    conclusion
    input = gets.chomp.downcase
    if input == 'y'
      @round = 1
      guess_the_code
    else
      puts 'Have a great day!'
    end
  end
end

game = Mastermind.new
game.play_game
