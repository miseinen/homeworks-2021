# frozen_string_literal: true

def letter_digit_count(str)
  letter = []
  digit = []
  str.chars.each do |a|
    letter << a if %r{[[:alpha:]]}.match(a)
    digit << a if %r{\d}.match(a)
  end
  puts "letters: #{letter.count}, digits: #{digit.count}"
end

letter_digit_count('hel2!lo')
