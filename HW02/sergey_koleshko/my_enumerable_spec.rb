require_relative 'my_enumerable'

using MyEnumerable

describe MyEnumerable do
  let(:empty_array) { [] }
  let(:array) { [0, 1, 2, 3, 4, 5] }

  context '#my_each' do
    context 'when array get block' do
      context 'when array empty' do
        it 'should return nothing' do
          expect(empty_array.my_each {}).to eq([])
        end
      end
      context 'when array is empty' do
        it 'should return array' do
          expect(array.my_each {}).to eq([0, 1, 2, 3, 4, 5])
        end
      end
    end

    context 'when array not get block' do
      context 'when array empty' do
        it 'should return nothing' do
          expect(empty_array.my_each).to eq([])
        end
      end

      context 'when array is not empty' do
        it 'should return nil' do
          expect(array.my_each).to eq([0, 1, 2, 3, 4, 5])
        end
      end
    end
  end

  context '#my_select' do
    context 'when array get block' do
      context 'whem array is empty' do
        it 'should return empty array' do
          expect(empty_array.my_select {}).to eq([])
        end
      end

      context 'when array is not empty'
      it 'should return empty array' do
        expect(array.my_select {}).to eq([])
      end
    end
  end

  context 'when array not get block' do
    context 'empty array' do
      it 'should return empty array' do
        expect(empty_array.my_select).to eq([])
      end
    end

    context 'when array is not empty' do
      it 'should return array' do
        expect(array.my_select).to eq([0, 1, 2, 3, 4, 5])
      end
    end
  end

  context '#my_map' do
    context 'when array get block' do
      context 'when array is empty' do
        it 'should return empty array' do
          expect(empty_array.my_map {}).to eq([])
        end
      end
      context 'when array is not empty' do
        it 'should return array' do
          expect(array.my_map {}).to eq([nil, nil, nil, nil, nil, nil])
        end
      end
    end

    context 'when array not get block' do
      context 'when array is empty' do
        it 'should return empty array' do
          expect(empty_array.my_map).to eq([])
        end
      end
      context 'when array is not empty' do
        it 'should return array' do
          expect(array.my_map).to eq([0, 1, 2, 3, 4, 5])
        end
      end
    end
  end
end
