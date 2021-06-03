# frozen_string_literal: true

require 'rspec'
require_relative 'task_1'

RSpec.describe 'Test task_1.rb' do
  context 'when logs has errors' do
    let(:logs) do
      <<~LOG
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
        2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
        10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
      LOG
    end

    let(:expected_results) do
      '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
    end
    it 'returns full text first line with an error' do
      expect(task_1(logs)).to eq(expected_results)
    end
  end

  context 'when logs has no line with errors' do
    let(:log) do
      <<~LOG
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
        10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
      LOG
    end
    it 'returns an empty line' do
      expect(task_1(log)).to eq('')
    end
  end

  context 'when logs has many errors' do
    let(:logs_with_errors) do
      <<~LOG
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
        2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
        10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
        2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
      LOG
    end

    let(:expected_results) do
      '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
    end
    it 'returns first line with errors' do
      expect(task_1(logs_with_errors)).to eq(expected_results)
    end
  end

  context 'when no arguments is given' do
    it 'returns Error' do
      expect { task_1 }.to raise_error(ArgumentError)
    end
  end
  context 'when logs does not get the text' do
    it 'returns empty line' do
      expect(task_1('')).to eq('')
    end
  end
  context 'when logs gets a random text' do
    it 'returns Error' do
      expect { task_1 }.to raise_error(ArgumentError)
    end
  end
end
