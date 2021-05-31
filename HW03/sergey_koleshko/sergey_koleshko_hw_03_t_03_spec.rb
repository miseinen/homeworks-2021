require_relative 'sergey_koleshko_hw_03_t_03'

describe '.difference_time' do
  let(:logs_with_call) do
    '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event'
  end

  let(:logs_with_many_call) do
    '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
2018-04-23 17:19:28.8 ubuntu-xenial[14319] Debug - Calling core with action: messages'
  end

  let(:logs_without_call) do
    '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event'
  end

  let(:logs_only_call) do
    '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages'
  end

  let(:logs_empty) { '' }

  context 'when logs is empty' do
    it 'should return "0"' do
      expect(difference_time(logs_empty)).to eq(['0'])
    end
  end

  context 'when logs without calling' do
    it 'should retunr "0"' do
      expect(difference_time(logs_without_call)).to eq(['0'])
    end
  end

  context 'when logs with calling' do
    it 'should return "49.1"' do
      expect(difference_time(logs_with_call)).to eq(['49.1'])
    end
  end

  context 'when logs with only calling' do
    it 'should return "49.1"' do
      expect(difference_time(logs_only_call)).to eq(['49.1'])
    end
  end

  context 'when logs with many calling' do
    it 'should return array with two difference time' do
      expect(difference_time(logs_with_many_call)).to eq(['49.1', '50.0'])
    end
  end
end
