# frozen_string_literal: true

require_relative '../andrey_bakanovsky_hw_03_t_03'

RSpec.describe 'hw_03_t_03' do
  let(:log_one_line_colling) { '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event' }
  let(:log_one_line_without_colling) { '2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed' }
  let(:output_datetime) { '2018-04-23 17:17:49.7' }
  let(:log_without_datetime) { '--- WhenLogDoesNotContainTimeString' }

  let(:logs_calling) do
    <<~LGSOUTPUT0
      2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
      2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
    LGSOUTPUT0
  end

  let(:logs_without_calling) do
    <<~LGSOUTPUT1
      2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
      2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
    LGSOUTPUT1
  end

  let(:logs_one_calling) do
    <<~LGSOUTPUT2
      2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
      2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
    LGSOUTPUT2
  end

  let(:logs_multi_calling) do
    <<~LGSOUTPUT3
      2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
      2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
      2018-04-23 17:18:13.7 ubuntu-xenial[14319] Debug - Calling core with action: event
      2018-04-23 17:20:50.1 ubuntu-xenial[14319] Debug - Calling core with action: event
    LGSOUTPUT3
  end

  describe 'contains_calling_core?' do
    it 'reaturns true' do
      expect(contains_calling_core?(log_one_line_colling)).to be_truthy
    end

    it 'reaturns false' do
      expect(contains_calling_core?(log_one_line_without_colling)).to be_nil
    end
  end

  describe 'date_pars' do
    let(:execute_pars) { date_pars(/\A(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\.\d)/) }

    context 'when line contains time' do
      it 'reaturns string datetime' do
        expect(execute_pars.call(log_one_line_colling)).to eq(output_datetime)
      end
    end

    context 'when line doesn\'t contain time' do
      it 'reaturns empty string' do
        expect(execute_pars.call(log_without_datetime)).to be_nil
      end
    end
  end

  describe 'task_3' do
    context 'when log has two lines with colling' do
      it 'prints the duration between the time' do
        expect { task_3(logs_calling) }.to output(['49.1'].to_s + "\n").to_stdout
      end
    end

    context 'when log has no lines with colling' do
      it 'prints "0"' do
        expect { task_3(logs_without_calling) }.to output("\"0\"\n").to_stdout
      end
    end

    context 'when log has one line with colling' do
      it 'prints "0"' do
        expect { task_3(logs_one_calling) }.to output("\"0\"\n").to_stdout
      end
    end

    context 'when log has several lines with colling' do
      it 'prints an array of duration betwen events' do
        expect { task_3(logs_multi_calling) }.to output(['24.0', '156.4'].to_s + "\n").to_stdout
      end
    end
  end
end
