module ArrayMethods
  refine Array do
    def my_map
      new_arr = []
      for i in 0...self.length
        new_arr << yield(self[i]) if block_given?
      end
      new_arr
    end

    def my_select
      new_arr = []
      for i in 0...self.length
        new_arr << self[i] if block_given? && yield(self[i])
      end
      new_arr
    end

    def my_each
      for i in 0...self.length
        yield(self[i]) if block_given?
      end
      self
    end
  end
end