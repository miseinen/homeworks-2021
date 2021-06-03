# frozen_string_literal: true

require_relative 'my_array_method'

using MyArrayMethod

RSpec.describe 'MyArrayMethod' do
  describe '#my_map' do
    context 'when array is empty' do
      let(:empty_array) { [] }

      it 'returns an empty array' do
        expect(empty_array.my_map(&:even?)).to be_empty
      end
    end

    context 'when array is not empty' do
      let(:array) { [1, 2, 3] }
      it 'returns the same number of elements as the original array' do
        expect(array.my_map(&:even?).count).to eq(array.count)
      end

      it 'does not modify the original array' do
        expect(array.my_each { |x| x * 2 }).to eq([1, 2, 3])
      end
    end

    context 'when array digits multiplication' do
      let(:array) { [1, 2, 3, 4, 5] }

      it 'returns new array with multiplication' do
        expect(array.my_map { |x| x * 2 }).to eq([2, 4, 6, 8, 10])
      end
    end
  end

  describe '#my_each' do
    context 'when array is empty' do
      let(:empty_array) { [] }

      it 'returns eampty array' do
        expect(empty_array.my_each { |x| x + 1 }).to eq([])
      end
    end

    context 'when array is no empty' do
      let(:array) { [1, 2, 3, 4, 5] }

      it 'origin array does not change' do
        expect(array.my_each { |x| x + 1 }).to eq([1, 2, 3, 4, 5])
      end
    end

    context 'when array digits multiplication' do
      let(:array) { [1, 2, 3, 4, 5] }

      it 'returns main array' do
        expect(array.my_each { |x| x + 2 }).to eq([1, 2, 3, 4, 5])
      end
    end
  end

  describe '#my_select' do
    context 'when array is empty' do
      let(:empty_array) { [] }

      it 'returns eampty array' do
        expect(empty_array.my_select { |x| x > 1 }).to eq([])
      end
    end

    context 'when array has block' do
      let(:array) { [1, 2, 3, 4, 5] }

      it 'returns a new array containing all elements of ary for which the given block returns a true value' do
        expect(array.my_select { |x| x > 2 }).to eq([3, 4, 5])
      end
    end
  end
end
