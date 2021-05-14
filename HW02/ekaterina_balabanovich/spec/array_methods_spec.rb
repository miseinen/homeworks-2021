# frozen_string_literal: true

require_relative '../array_methods'

using ArrayMethods

describe ArrayMethods do
  describe '#my_map' do
    context 'when array is empty' do
      it 'should be empty' do
        array = []
        expect(array.my_map(&:odd?)).to be_empty
      end
    end
    context 'when array is not empty' do
      it 'should return array' do
        array = [1, 2, 3]
        expect(array.my_map(&:odd?)).to eq([true, false, true])
      end
      it 'should return the same number of elements as the original array' do
        array = [1, 2, 3, 5, 6]
        expect(array.my_map(&:odd?).count).to eq(array.count)
      end
    end
    context 'when block is not given' do
      it 'should return nil' do
        array = [1, 2, 3]
        expect(array.my_map).to be nil
      end
    end
    context 'when block is given' do
      it 'should return sum of each elements if block uses sum' do
        array = [1, 2, 3]
        expect(array.my_map { |a| a + 1 }).to eq([2, 3, 4])
      end
      it 'should return multiplication of elements if block uses multiplication' do
        array = [1, 2, 3]
        expect(array.my_map { |a| a * 2 }).to eq([2, 4, 6])
      end
      it 'should not change the original array' do
        array = [1, 2, 3]
        array.my_map { |a| a + 1 }
        expect(array).to eq([1, 2, 3])
      end
    end
  end
  describe '#my_select' do
    context 'when array is empty' do
      it 'should be empty' do
        array = []
        expect(array.my_select(&:odd?)).to be_empty
      end
    end
    context 'when array is not empty' do
      it 'should return array' do
        array = [1, 2, 3]
        expect(array.my_select(&:odd?)).to eq([1, 3])
      end
    end
    context 'when block is not given' do
      it 'should return nil' do
        array = [1, 2, 3]
        expect(array.my_select).to be nil
      end
    end
    context 'when block is given' do
      it 'should return only odd numbers if block checks odd numbers' do
        array = [1, 2, 3, 4]
        expect(array.my_select(&:odd?)).to eq([1, 3])
      end
      it 'should return only zero numbers if block checks zero numbers' do
        array = [0, 2, 0, 4]
        expect(array.my_select(&:zero?)).to eq([0, 0])
      end
      it 'should not change the original array' do
        array = [1, 2, 3]
        array.my_select { |a| a + 1 }
        expect(array).to eq([1, 2, 3])
      end
    end
  end
end
