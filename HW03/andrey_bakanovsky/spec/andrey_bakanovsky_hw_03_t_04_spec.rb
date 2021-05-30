# frozen_string_literal: true

require_relative '../andrey_bakanovsky_hw_03_t_04'

RSpec.describe 'hw_03_t_04' do
  describe ' task_04' do
    context 'when string contains letters and digits' do
      it 'prints the count of letters and digits' do
        expect { task_4('the 1') }.to output("{letters: 3, digits: 1}\n").to_stdout
      end
    end

    context 'when string contains only letters' do
      it 'prints the count of letters and 0 digits' do
        expect { task_4('Seven Samurai') }.to output("12 --- {letters: 12, digits: 0}\n").to_stdout
      end
    end

    context 'when string contains only digits' do
      it 'prints the count of 0 letters and n digits' do
        expect { task_4('6.4.3.2.1') }.to output("{letters: 0, digits: 5}\n").to_stdout
      end
    end

    context 'when string is empty' do
      it 'prints the count of 0 letters and 0 digits' do
        expect { task_4('') }.to output("0 --- {letters: 0, digits: 0}\n").to_stdout
      end
    end

    context 'when contains only symbols' do
      it 'prints the count of 0 letters and 0 digits' do
        expect { task_4('<>?+-~!@#$%^&*(__:-);))))))\"||=') }.to output("0 --- {letters: 0, digits: 0}\n").to_stdout
      end
    end
  end
end
