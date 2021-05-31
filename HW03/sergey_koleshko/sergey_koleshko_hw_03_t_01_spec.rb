require_relative 'sergey_koleshko_hw_03_t_01'

describe '.break_error' do
  let(:logs_with_error) do
    '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290'
  end

  let(:logs_without_error) do
    '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290'
  end

  let(:logs_empty) { '' }

  context 'when logs with error' do
    it 'should return string with error' do
      expect(break_error(logs_with_error)).to eq('2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>')
    end
  end

  context 'when logs withot error' do
    it 'should return empty string' do
      expect(break_error(logs_without_error)).to eq('')
    end
  end

  context 'when logs is empty' do
    it 'should return empty string' do
      expect(break_error(logs_empty)).to eq('')
    end
  end
end
