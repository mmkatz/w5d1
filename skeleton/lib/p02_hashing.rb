class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash_key = 0
    self.each_with_index do |ele, i|
      hash_key += (ele.hash ^ i.hash)
    end
    hash_key
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
