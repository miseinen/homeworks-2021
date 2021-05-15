# frozen_string_literal: true

require_relative '../balabanovich_hw03_task_4'

RSpec.describe 'Task4' do
  describe '#letter_digit_count' do
    context 'when string is empty' do
      it 'returns answer with 0' do
        expect(letter_digit_count('')).to eq('letters: 0, digits: 0')
      end
    end

    context 'when string is not empty' do
      it 'returns letters, digits count' do
        expect(letter_digit_count('hel!0')).to eq('letters: 3, digits: 1')
      end
    end

    context 'when argument is not string' do
      it 'raises NoMethodError' do
        expect { letter_digit_count(12) }.to raise_error NoMethodError
      end
    end
  end
end
