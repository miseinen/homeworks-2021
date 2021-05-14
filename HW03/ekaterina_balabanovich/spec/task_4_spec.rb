# frozen_string_literal: true

require_relative '../balabanovich_hw03_task_4'

describe 'Task4' do
  describe '#letter_digit_count' do
    context 'when string is empty' do
      it 'should return answer with 0' do
        expect(letter_digit_count('')).to eq('letters: 0, digits: 0')
      end
    end
    context 'when string is not empty' do
      it 'should return letters, digits count' do
        expect(letter_digit_count('hel!0')).to eq('letters: 3, digits: 1')
        expect(letter_digit_count('hel2!lo')).to eq('letters: 5, digits: 1')
        expect(letter_digit_count('@#$!')).to eq('letters: 0, digits: 0')
      end
    end
    context 'when argument is not string' do
      it 'raises NoMethodError' do
        expect { letter_digit_count(12) }.to raise_error NoMethodError
      end
    end
  end
end
