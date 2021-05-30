# frozen_string_literal: true

require_relative '../andrey_bakanovsky_hw_03_t_02'

RSpec.describe 'hw_03_t_02' do
  let(:logs_careless) do
    <<~LGSOUTPUT0
      10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
      10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
      2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: ,#<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
      *3,1415926535
      10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
      [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
      -----
      10.6.246.101 - - "POST /test/2/messages HTTP/1.1" 200 48 0.0290
      10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST HTTP/1.1" 200 48 0.0290
    LGSOUTPUT0
  end

  let(:output_array) do
    ['DATA 23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
     'DATA 23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
     'DATA 23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES']
  end

  let(:log_empty) do
    <<~LGSOUTPUT1
    LGSOUTPUT1
  end

  let(:log_non_format) do
    <<~LGSOUTPUT2
      '[23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
      10.6.246.101 - - "POST /test/2/messages HTTP/1.1" 200 48 0.0290'
    LGSOUTPUT2
  end

  describe 'task_2' do
    context 'when log contain lines'
    it 'prints an array of lines which match the fotmat' do
      expect { task_2(logs_careless) }.to output("#{output_array}\n").to_stdout
    end

    context 'when log is empty' do
      it 'prints an empty array' do
        expect { task_2(log_empty) }.to output("[]\n").to_stdout
      end
    end

    context 'when log is no suitable string at the input' do
      it 'prints an empty array' do
        expect { task_2(log_non_format) }.to output("[]\n").to_stdout
      end
    end
  end
end
