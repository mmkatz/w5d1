class MaxIntSet
  attr_reader :store

  def initialize(max)
    @max = max 
    @store = Array.new(max + 1) {false}

  end

  def insert(num)
      raise "already exists" if include?(num)
      validate!(num) if is_valid?(num) 
  end

  def remove(num)
    
    validate!(num) if is_valid?(num) && include?(num) 
  end

  def include?(num)
    @store[num] 
  end

  private

  def is_valid?(num)
     raise "Out of bounds" if num > @max || num < 0
     true 
  end

  def validate!(num)
    if @store[num] == false 
      @store[num] = true 
    else 
      @store[num] = false 
    end
  end
end


class IntSet
   
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num if !self.include?(num)
  end

  def remove(num)
   self[num].delete(num) if self.include?(num)
  end

  def include?(num)
    self[num].each do |number|
      return true if number == num
    end
    return false
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
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self.include?(num)
        self[num] << num 
        @count += 1 
    end

    if @count > num_buckets
      resize! 
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num) 
         @count -= 1 
    end
 
  end

  def include?(num)
      self[num].each do |number|
      return true if number == num
    end
    return false
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
        new_store[ele % (num_buckets * 2)] << ele 
      end
    end
    @store = new_store 
  end
end
