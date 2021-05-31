require_relative 'sergey_koleshko_hw_03_t_02'

describe '.formatted_requests' do
  let(:logs_with_requests) do
    '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290'
  end

  let(:logs_without_requests) { '2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>' }

  let(:logs_empty) { '' }

  context 'when logs with post requests' do
    it 'should return array with information about requests' do
      expect(formatted_requests(logs_with_requests)).to eq(['23/Apr/2018:20:30:39 +0300 FROM: 1 TO: /TEST/2/MESSAGES', '23/Apr/2018:20:30:42 +0300 FROM: 1 TO: /TEST/2/RUN', '23/Apr/2018:20:31:39 +0300 FROM: 1 TO: /TEST/2/MESSAGES'])
    end
  end

  context 'when logs without post requests' do
    it 'should return empty array' do
      expect(formatted_requests(logs_without_requests)).to eq([])
    end
  end

  context 'when logs is empty' do
    it 'should return empty array' do
      expect(formatted_requests(logs_empty)).to eq([])
    end
  end
end
