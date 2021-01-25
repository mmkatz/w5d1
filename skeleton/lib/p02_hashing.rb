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
    hash_key = 531
    self.each_char.with_index do |char, i|
      hash_key += (char.ord.hash ^ i.hash)
    end
    hash_key
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    arr = []
    self.each do |k, v| 
      arr << [k,v]
    end
    arr.sort!
    hash_key = 934
    arr.each do |sub|
      sub.each_with_index do |ele, idx|
        hash_key += (ele.hash ^ idx.hash)
      end
    end
    hash_key
  end
end
