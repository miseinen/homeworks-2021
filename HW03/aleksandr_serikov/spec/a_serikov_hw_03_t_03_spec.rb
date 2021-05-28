require_relative '../a_serikov_hw_03_t_03'

describe 'task3' do
  context 'when log has two core events' do
    let(:logs) do
      <<~LOGS
        2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
        2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
        2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
        2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
        2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
      LOGS
    end

    it 'returns the period between core events' do
      expect(task3(logs)).to eql('49.1')
    end
  end

  context 'when log has four core events' do
    let(:logs) do
      <<~LOGS
        2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
        2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
        2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
        2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
        2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - Calling core with action: event2
        2018-04-23 17:20:00.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        2018-04-23 17:21:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages2
      LOGS
    end

    it 'returns the period between core events' do
      expect(task3(logs)).to eql(["49.1", "21.0", "159.0"])
    end
  end

  context 'when there are no core events in the logs' do
    let(:logs) do
      <<~LOGS
        2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
        2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
        2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
      LOGS
    end

    it "returns '0'" do
      expect(task3(logs)).to eql('0')
    end
  end
end
