module ArrayMethods
  refine Array do
    def my_map
      mapped = []
      for i in 0...self.length
        mapped << yield(self[i]) if block_given?
      end
      mapped
    end

    def my_select
      selected = []
      for i in 0...self.length
        selected << self[i] if block_given? && yield(self[i])
      end
      selected
    end

    def my_each
      for i in 0...self.length
        yield(self[i]) if block_given?
      end
      self
    end
  end
end