# frozen_string_literal: true

def letter_digit_count(str)
  letter_regex = %r{[[:alpha:]]}
  letter_count = str.scan(letter_regex).count
  digit_regex = %r{\d}
  digit_count = str.scan(digit_regex).count

  puts "letters: #{letter_count}, digits: #{digit_count}"
end

letter_digit_count('hel2!lo')
