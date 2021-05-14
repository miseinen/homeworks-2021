# frozen_string_literal: true

require_relative '../balabanovich_hw03_task_3'

RSpec.describe 'Task3' do
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

  let(:empty_logs) { '' }

  let(:one_line_logs) do
    '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event'
  end

  describe '#extract_core_log' do
    context 'when logs are not empty' do
      it 'should return lines that include "calling core"' do
        first_extracted_line = extract_core_log(logs).lines.first.downcase
        expect(first_extracted_line.include?('calling core')).to be true
      end
    end
    context 'when logs are empty' do
      it 'should return an empty string' do
        expect(extract_core_log(empty_logs)).to eq('')
      end
    end
    context 'when logs are not string' do
      it 'raises NoMethodError' do
        expect { extract_core_log(12) }.to raise_error NoMethodError
      end
    end
  end

  describe '#duration_count' do
    context 'when logs are not empty' do
      context 'when logs contain one line' do
        it 'should return 0' do
          expect(duration_count(one_line_logs)).to eq(0)
        end
      end
      context 'when logs contain more lines' do
        it 'should return duration between events' do
          expect(duration_count(extract_core_log(logs)).first).to eq(49.1)
        end
      end
    end
    context 'when logs are empty' do
      it 'should return 0' do
        expect(duration_count(empty_logs)).to eq(0)
      end
    end
    context 'when logs are not string' do
      it 'raises NoMethodError' do
        expect { duration_count(12) }.to raise_error NoMethodError
      end
    end
  end
end
