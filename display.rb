require 'colorize'

module Display
  def instructions
    puts <<~HEREDOC

      How to play Mastermind:\n
      You first choose to be either the code #{'MAKER'.red} or code #{'BREAKER'.red}.

      The code #{'BREAKER'.red} will have 12 turns to decipher the code that the #{'MAKER'.red} has created.

      The code consists of 4 digits, each digit ranging from 1-6.

      Feedback will be given with each entry to show how close the guess was to the hidden code.

      When guessing a correct number that is also in the correct position you will get an #{'X'.blue} and if the guess contains a correct number but is not in the correct position, you will get a #{'O'.yellow}. The hints do not help to tell you where the correct number is placed.

      Good Luck Code Breaker!\n\n
    HEREDOC
  end

  def round_output(round)
    case round
    when 12
      puts 'This is your final guess! Think hard about your final input: '
    else
      puts "round ##{round}, Enter a 4 digit input:"
    end
  end

  def input_error
    puts 'Input needs to be 4 numbers. Try again.'
  end

  def win_or_loss(game_over)
    game_over ? 'Yay the code has been cracked!' : 'You lose!'
  end

  def conclusion
    puts 'Would you like to play again? y or n?'
  end
end