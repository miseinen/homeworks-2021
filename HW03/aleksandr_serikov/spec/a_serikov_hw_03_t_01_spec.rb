require_relative '../a_serikov_hw_03_t_01'

describe 'task1' do
  context 'when logs have line with error' do
    let(:logs) do
      <<~LOGS
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
        2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
        10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
      LOGS
    end

    let(:expected_result) do
      '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , '\
       '#<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
    end

    it 'returns string with error' do
      expect(task1(logs)).to eql(expected_result)
    end
  end

  context "when logs haven't line with error" do
    let(:logs) do
      <<~LOGS
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
        10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
      LOGS
    end

    it 'returns empty string' do
      expect(task1(logs)).to eql('')
    end
  end
end
