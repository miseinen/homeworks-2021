# frozen_string_literal: true

require 'rspec'

require_relative '../den_havanski_hw_03_t_03'
require_relative 'spec_helper'

RSpec.describe 'task3' do
  describe '#return_action_duration' do
    context 'when there are no valid events' do
      let(:log_no_val_events) do
        <<~INPUT
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - core with action: event
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - Cal docker event processed
          2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug -  with action: messages
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        INPUT
      end

      it 'returns zero' do
        expect(task3(log_no_val_events)).to eq('0')
      end
    end

    context 'when there are only one valid event' do
      let(:log_only_one_val_event) do
        <<~INPUT
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
          2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug -  with action: messages
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        INPUT
      end

      it 'returns zero' do
        expect(task3(log_only_one_val_event)).to eq('0')
      end
    end

    context 'there are many valid events' do
      let(:log_more_two_val_events) do
        <<~INPUT
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - Calling core docker event processed
          2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - Calling core inside docker_handle_event
        INPUT
      end

      let(:expected_output) { ['0.1', '49.0', '21.0'] }

      it 'return an array of duration betwenn 1st and 2nd, 2nd and 3rd and etc' do
        expect(task3(log_more_two_val_events)).to eq(expected_output)
      end
    end

    context 'there are pair of valid events' do
      let(:log_normal) do
        <<~INPUT
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
          2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        INPUT
      end

      it 'return STRING with the duration of the action' do
        expect(task3(log_normal)).to eql('49.1')
      end
    end
  end
end
