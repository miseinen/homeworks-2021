require_relative '../a_serikov_hw_03_t_02'

describe 'task2' do
  context 'when logs have information about post requests' do
    let(:logs) do
      <<~LOGS
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
        2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
        10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
      LOGS
    end
    let(:expected_result) do
      ["23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES",
       "23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN",
       "23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES"]
    end

    it 'returns an array of formatted strings' do

      expect(task2(logs)).to eql(expected_result)
    end
  end

  context "when logs haven't information about post requests" do
    let(:logs) do
      <<~LOGS
        2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
        2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
      LOGS
    end

    it 'return an empty array' do
      expect(task2(logs)).to eql([])
    end
  end
end
