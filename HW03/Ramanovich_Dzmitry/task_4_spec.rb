# frozen_string_literal: true

require 'rspec'
require_relative 'task_4'

RSpec.describe 'Test task_4' do
  context 'when input has only digits' do
    it 'output has only quantity digits' do
      expect(quantity('12345')).to eq({ digits: 5, letters: 0 })
    end
  end
  context 'when input has only letters' do
    it 'output has only quantity letters' do
      expect(quantity('qwerty')).to eq({ digits: 0, letters: 6 })
    end
  end
  context 'when input has only symbols' do
    it 'output has 0 letters and 0 digits' do
      expect(quantity('/////,.,.,')).to eq({ digits: 0, letters: 0 })
    end
  end
  context 'when input has no arguments' do
    it 'returns Error' do
      expect { quantity }.to raise_error(ArgumentError)
    end
  end
  context 'when input has symbols, letters or digits' do
    it 'returns quantity has only letters and digits' do
      expect(quantity('123zxc///')).to eq({ digits: 3, letters: 3 })
    end
  end
  context 'when input has empty line' do
    it 'output has 0 letters and 0 digits' do
      expect(quantity('')).to eq({ digits: 0, letters: 0 })
    end
  end
end
