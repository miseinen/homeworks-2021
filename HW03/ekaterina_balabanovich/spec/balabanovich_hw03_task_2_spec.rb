# frozen_string_literal: true

require_relative '../balabanovich_hw03_task_2'

RSpec.describe 'Task2' do
  describe '#log_format' do
    let(:logs) do
      <<~LOGS
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] 'POST /test/2/run HTTP/1.1' 200 - 0.2277
        2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
        10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0290
      LOGS
    end

    let(:error_logs) do
      <<~LOGS
        2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
        2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
        2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
      LOGS
    end

    context 'when logs are not empty' do
      it 'returns a string in a specific format' do
        expect(log_format(logs).first).to eq('23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES')
      end

      it 'skips errors cases' do
        expect(log_format(error_logs)).to eq([])
      end
    end

    context 'when logs are empty' do
      let(:empty_logs) { '' }

      it 'returns an empty array' do
        expect(log_format(empty_logs)).to eq([])
      end
    end

    context 'when logs are not string' do
      it 'raises NoMethodError' do
        expect { log_format(12) }.to raise_error NoMethodError
      end
    end
  end
end
