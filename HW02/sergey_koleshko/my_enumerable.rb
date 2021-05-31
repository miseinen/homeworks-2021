module MyEnumerable
  refine Integer do
    def my_times
      for i in 0...self
        yield(i)
      end
    end

    def my_upto(count)
      for i in self...count
        yield(i)
      end
    end
  end

  refine Array do
    def my_each
      if block_given?
        for i in 0...length
          yield(self[i])
        end
      end
      self
    end

    def my_map
      temp = []
      if block_given?
        for i in 0...length
          temp << yield(self[i])
        end
        return temp
      end
      self
    end

    def my_select
      temp = []
      if block_given?
        for i in 0...length
          temp << self[i] if yield(self[i])
        end
        return temp
      end
      self
    end
  end
end
