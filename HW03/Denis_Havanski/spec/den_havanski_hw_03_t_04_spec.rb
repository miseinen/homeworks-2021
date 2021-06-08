# frozen_string_literal: true

require 'rspec'

require_relative '../den_havanski_hw_03_t_04'
require_relative 'spec_helper'

RSpec.describe 'task4' do
  describe '#return_count' do
    let(:string_with_all) { 'hel2!lo' }

    let(:string_with_all_all) { 'LJjom&*&odfщоыо/?<вадоыва938984:*(Щьдьждб*&(*KJLMLM<:<' }

    let(:string_without_dig) { 'wicked .. !' }

    let(:string_empty) { '' }

    let(:no_string) { :string }

    context 'when there is valid string' do
      it 'return hash with count of letters and digits', :aggregate_failures do
        expect(task4(string_with_all)).to eql({ letters: 5, digits: 1 })
        expect(task4(string_without_dig)).to eql({ letters: 6, digits: 0 })
        expect(task4(string_with_all_all)).to eql({ letters: 32, digits: 6 })
      end

      context 'when there is empty string' do
        it 'return the hash with zeros as all totals' do
          expect(task4(string_empty)).to eql({ letters: 0, digits: 0 })
        end
      end

      context 'when there is no string' do
        it 'return error' do
          expect { task4(no_string) }.to raise_error(NoMethodError, "undefined method `count' for :string:Symbol")
        end
      end
    end
  end
end
