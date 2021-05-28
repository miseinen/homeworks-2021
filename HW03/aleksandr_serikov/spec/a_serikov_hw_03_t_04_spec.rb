require_relative '../a_serikov_hw_03_t_04'

describe '#task4' do
  context 'when the method accepts an empty string' do
    it { expect(task4('')).to eql(letters: 0, digits: 0) }
  end

  context 'when the method only accepts numbers' do
    it { expect(task4('777')).to eql(letters: 0, digits: 3) }
  end

  context 'when the method only accepts letters' do
    it { expect(task4('Hello')).to eql(letters: 5, digits: 0) }
  end

  context 'when the method accepts on different values' do
    it { expect(task4('10 dollars!!!')).to eql(letters: 7, digits: 2) }
  end

  context 'when the method only accepts inappropriate values' do
    it { expect(task4('😀😀😀😀😀!@%^')).to eql(letters: 0, digits: 0) }
  end
end
