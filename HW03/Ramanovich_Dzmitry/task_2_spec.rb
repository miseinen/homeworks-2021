# frozen_string_literal: true

require 'rspec'
require_relative 'task_2'

RSpec.describe 'Test task_2.rb' do
  context 'when logs is empty' do
    it 'returns an empty array' do
      expect(task2('')).to eq([])
    end
  end

  context 'when logs gets random text' do
    it 'returns Error' do
      expect { task2 }.to raise_error(ArgumentError)
    end
  end

  context 'when logs has wrong format' do
    let(:logs) do
      <<~LOGS
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
        2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
        10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
      LOGS
    end

    let(:right_logs) do
      [
        'DATE: [23/Apr/2018:20:30:39 +0300] FROM: 10.6.246.103 TO: ["/test/2/messages"]',
        'DATE: [23/Apr/2018:20:30:42 +0300] FROM: 10.6.246.101 TO: ["/test/2/run"]',
        'DATE: [23/Apr/2018:20:31:39 +0300] FROM: 10.6.246.101 TO: ["/test/2/messages"]'
      ]
    end

    it 'wrong format should be ignored' do
      expect(task2(logs)).to eq(right_logs)
    end
  end

  context 'when logs has many errors' do
    let(:logs_with_errors) do
      <<~LOGS
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
          2020-04-23 SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          2020-04-23 SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          2020-04-23 SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
      LOGS
    end

    let(:right_logs) do
      [
        'DATE: [23/Apr/2018:20:30:39 +0300] FROM: 10.6.246.103 TO: ["/test/2/messages"]',
        'DATE: [23/Apr/2018:20:30:42 +0300] FROM: 10.6.246.101 TO: ["/test/2/run"]',
        'DATE: [23/Apr/2018:20:31:39 +0300] FROM: 10.6.246.101 TO: ["/test/2/messages"]'
      ]

      it 'returns only right format in array' do
        expect(task2(logs_with_errors)).to eq(right_logs)
      end
    end

    context 'when logs has no error' do
      let(:right_logs) do
        [
          'DATE: [23/Apr/2018:20:30:39 +0300] FROM: 10.6.246.103 TO: ["/test/2/messages"]',
          'DATE: [23/Apr/2018:20:30:42 +0300] FROM: 10.6.246.101 TO: ["/test/2/run"]',
          'DATE: [23/Apr/2018:20:31:39 +0300] FROM: 10.6.246.101 TO: ["/test/2/messages"]'
        ]
      end

      let(:only_right_logs_format) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
          10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
        LOGS
      end

      it 'returns all logs in array' do
        expect(task2(only_right_logs_format)).to eq(right_logs)
      end
    end
    context 'when logs has only errors' do
      let(:logs_only_errors) do
        <<~LOGS
          2020-04-23 SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
            2020-04-23 SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
            2020-04-23 SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
        LOGS
      end
      it 'returns an empty array' do
        expect(task2(logs_only_errors)).to eq([])
      end
    end
  end
end
