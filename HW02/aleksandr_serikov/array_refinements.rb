module ArrayRefinement

  refine Array do
  
    def each
      return unless block_given?
      
      for i in 0...size
        yield self[i] 
      end
      self
    end
    
    def map
      return unless block_given?
      
      new_array = []
      for i in 0...size
        new_array << yield(self[i])
      end
    
      new_array
    end
    
    def select
      return unless block_given?
    
      new_array = []
      for i in 0...size
        new_array << self[i] if yield(self[i])
      end
    
      new_array
    end
    
  end 
  
end

