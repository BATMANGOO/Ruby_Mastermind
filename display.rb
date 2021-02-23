require 'colorize'

module Display
  def self.instructions
    puts "How to play Mastermind:\n
  You first choose to be either the code #{'MAKER'.red} or code #{'BREAKER'.red}.

  The code #{'BREAKER'.red} will have 12 turns to decipher the code that the #{'MAKER'.red} has created.

  The code consists of 4 digits, each digit ranging from 1-6.

  Feedback will be given with each entry to show how close the guess was to the hidden code.

  When guessing a correct number that is also in the correct position you will get an #{'X'.red} and if the guess contains a correct number but is not in the correct position, you will get a #{'O'.yellow}"
  end

  def self.all_correct
    puts "Horray you cracked the code!"
  end
end