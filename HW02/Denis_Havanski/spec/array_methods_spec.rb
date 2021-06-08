# frozen_string_literal: true

require 'rspec'

require_relative '../array_methods'
require_relative 'spec_helper'

using ArrayMethods

RSpec.describe ArrayMethods do
  let(:number_arr) { [1, -4, 78_421_397_493_947_923_408, 34.4, 0] }
  let(:mixed_arr) { ['sadfs', 645, :symb, { 1 => '1' }, true] }
  let(:empty_arr) { [] }
  let(:expected_for_empty) { [] }

  describe '#my_map' do
    context 'when block is not given' do
      it 'returns nil' do
        expect(number_arr.my_map).to be nil
      end
    end

    context 'when block is given' do
      let(:for_number_arr) do
        new_number_arr = []
        number_arr.my_map { |elem| new_number_arr << elem * 10 }
        return new_number_arr
      end

      let(:expected_output) { [10, -40, 784_213_974_939_479_234_080, 344, 0] }

      let(:for_empty_arr) do
        new_empty_arr = []
        empty_arr.my_map { |elem| new_empty_arr << elem * 10 }
        return new_empty_arr
      end

      it 'return new array with changes', :aggregate_failures do
        expect(for_number_arr).to eq(expected_output)
        expect(for_empty_arr).to eq(expected_for_empty)
      end
    end
  end

  describe '#my_select' do
    context 'when block is not given' do
      it 'return nil' do
        expect(number_arr.my_select).to be nil
      end
    end

    context 'when block is given' do
      let(:expected_for_number) { [78_421_397_493_947_923_408, 34.4] }

      it 'return new array with changes', :aggregate_failures do
        expect(number_arr.my_select { |elem| elem > 10 }).to eq(expected_for_number)
        expect(empty_arr.my_select { |elem| elem > 1 }).to eq(expected_for_empty)
      end
    end
  end

  describe '#my_each' do
    context 'when block is not given' do
      it 'return nil' do
        expect(number_arr.my_each).to be nil
      end
    end

    context 'when block is given' do
      it 'return original array!!!', :aggregate_failures do
        expect(number_arr.my_each { |elem| elem + 100_000_000_000_000_000 }).to eql(number_arr)
        expect(mixed_arr.my_each(&:to_s)).to eql(mixed_arr)
        expect(empty_arr.my_each { |elem| elem.nil? puts 'EMPTY!!!' }).to be empty_arr
      end
    end
  end
end
