# frozen_string_literal: true

require_relative '../andrey_bakanovsky_hw_03_t_01'

RSpec.describe 'hw_03_t_01' do
  let(:log1) { '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498' }
  let(:log2) do
    <<~LGSOUTPUT0
    2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
    LGSOUTPUT0
  end

  describe 'contains_error?' do
    let(:ask_contains_error) {contains_error?(/error/i)}

    it 'reaturns false' do
      expect(ask_contains_error.call(log1)).to be_nil
    end

    it 'reaturns true' do
      expect(ask_contains_error.call(log2)).to be_truthy
    end
  end

  describe 'task_1' do
    it 'passes line if text of line without \'error\'' do
      expect { task_1(log1) }.not_to output.to_stdout
    end

    it 'prints the line with \'error\'' do
      expect { task_1(log2) }.to output("#{log2}").to_stdout
    end
  end
end
