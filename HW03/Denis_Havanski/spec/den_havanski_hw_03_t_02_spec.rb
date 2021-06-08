# frozen_string_literal: true

require 'rspec'

require_relative '../den_havanski_hw_03_t_02'
require_relative 'spec_helper'

RSpec.describe 'task2' do
  describe '#return_check_result' do
    context 'when log is normal' do
      let(:log_normal) do
        <<~INPUT
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
        INPUT
      end

      let(:expected_output) do
        ['23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
         '23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
         '23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES']
      end

      it 'an array of formatted strings without errors' do
        expect(task2(log_normal)).to eq(expected_output)
      end

      context "when log all doesn't match the format" do
        let(:log_all_doesnt_match_format) do
          <<~INPUT
            .6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
            10.6.24ds6.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
            2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
            10.6.246.101 - - [23/Apr/2018-20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
          INPUT
        end

        let(:expected_output) { [] }

        it 'all no_format lines ignored (return [])' do
          expect(task2(log_all_doesnt_match_format)).to eq(expected_output)
        end
      end

      context 'when there is no suitable string at the input' do
        let(:log_no_suitable_input) { 1_243_354 }

        it 'return an empty array' do
          expect do
            task2(log_no_suitable_input)
          end.to raise_error(NoMethodError, "undefined method `split' for 1243354:Integer")
        end
      end
    end
  end
end
