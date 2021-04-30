# frozen_string_literal: true

LETTER_REGEX = %r{[[:alpha:]]}.freeze
DIGIT_REGEX = %r{\d}.freeze

def letter_digit_count(str)
  letter_count = str.scan(LETTER_REGEX).count
  digit_count = str.scan(DIGIT_REGEX).count

  puts "letters: #{letter_count}, digits: #{digit_count}"
end

letter_digit_count('hel2!lo')
