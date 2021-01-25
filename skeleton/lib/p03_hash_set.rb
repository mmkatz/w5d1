class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
      if !self.include?(key)
        self[key.hash] << key 
        @count += 1 

      end 
      resize! if @count > num_buckets
  end

  def include?(key)
     self[key.hash].each do |number|
      return true if number == key
    end
    return false
  end

  def remove(key)
      if self.include?(key)
      self[key.hash].delete(key) 
         @count -= 1 
      end 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
      mod = num % num_buckets
    return @store[mod]
  end

  def num_buckets
    @store.length
  end

  def resize!
      new_store = Array.new(num_buckets * 2 ) {Array.new}
    @store.each do |bucket|
      bucket.each do |ele|
        new_store[ele.hash % (num_buckets * 2)] << ele 
      end
    end
    @store = new_store 
  end
  
end
