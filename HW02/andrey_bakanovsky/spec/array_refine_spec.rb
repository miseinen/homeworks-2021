# frozen_string_literal: true

require_relative '../array_refine'

using ArrayRefine

RSpec.describe ArrayRefine, Array do
  subject(:test_array) { [11, 20, 93, 4, -5] }

  describe '#my_map' do
    context 'when calls for array' do
      let(:result_array) { [12, 21, 94, 5, -4] }

      it 'returns a new array' do
        expect(test_array.my_map { |x| x + 1 }).to match_array(result_array)
      end

      it 'don\'t modify original array' do
        expect(test_array.my_map { |x| x**3 }.object_id) != test_array.object_id
      end
    end

    context 'when calls for empty array' do
      it 'returns empty array' do
        expect([].my_map { |x| x }).to be_empty
      end
    end

    context 'when calls without block' do
      it 'returns empty array' do
        expect(test_array.my_map).to be_empty
      end
    end
  end

  describe '#my_select' do
    context 'when the block\'s condition is true' do
      it 'returns array of positive numbers' do
        expect(test_array.my_select(&:positive?)).to match_array([11, 20, 93, 4])
      end

      it 'returns array of even numbers' do
        expect(test_array.my_select(&:even?)).to match_array([20, 4])
      end

      it 'returns empty array' do
        expect(test_array.my_select { |x| x < -5 }).to be_empty
      end
    end

    context 'when calls for empty array' do
      it 'returns empty array' do
        expect([].my_select { |x| x < 1.14 }).to be_empty
      end
    end

    context 'when calls without block' do
      it 'returns empty array' do
        expect(test_array.my_select).to be_empty
      end
    end

    context 'when calls for array' do
      it 'don\'t modify original array' do
        expect(test_array.my_select { |x| x > 32 }.object_id) != test_array.object_id
      end
    end
  end

  describe '#my_each' do
    context 'when calls for array' do
      it 'returns a new array' do
        expect(test_array.my_each { |x| x }).to match_array(test_array)
      end

      it 'don\'t modify original array' do
        expect(test_array.my_each { |x| x**3 }.object_id) != test_array.object_id
      end

      it 'does not return new elements after operation in the block' do
        expect(test_array.my_each { |x| x * 0.314 }).to match_array(test_array)
      end
    end

    context 'when calls without block' do
      it 'returns original array' do
        expect(test_array.my_each).to match_array(test_array)
      end
    end

    context 'when calls for empty array' do
      it 'returns empty array' do
        expect([].my_each { |x| x }).to be_empty
      end
    end
  end
end
