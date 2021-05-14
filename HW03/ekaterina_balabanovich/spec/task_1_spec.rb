# frozen_string_literal: true

require_relative '../balabanovich_hw03_task_1'

describe 'Task1' do
  let(:one_error_logs) do
    "10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0498
    10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] 'POST /test/2/run HTTP/1.1' 200 - 0.2277
    2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
    10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0290"
  end

  let(:several_errors_logs) do
    "10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] 'POST /test/2/run HTTP/1.1' 200 - 0.2277
    2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
    2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
    2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
    10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0290"
  end

  let(:no_errors_logs) do
    "10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0498
    10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] 'POST /test/2/run HTTP/1.1' 200 - 0.2277
    10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0290"
  end

  let(:no_logs) { ''}

  describe '#error_extract' do
    context 'when one error occurred' do
      it 'should return one line' do
        expect(error_extract(one_error_logs).lines.count).to eq(1)
      end
      it 'should include "error" in returned line' do
        expect(error_extract(one_error_logs).include?('error')).to be true
      end
    end
    context 'when several errors occurred' do
      it 'should return one line' do
        expect(error_extract(several_errors_logs).lines.count).to eq(1)
      end
      it 'should include "error" in returned line' do
        expect(error_extract(one_error_logs).include?('error')).to be true
      end
    end
    context 'when no errors occurred' do
      it 'should return empty string' do
        expect(error_extract(no_errors_logs)).to eq('')
      end
    end
    context 'when no logs' do
      it 'should return empty string' do
        expect(error_extract(no_errors_logs)).to eq('')
      end
    end
  end
end
