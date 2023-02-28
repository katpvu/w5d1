class Integer
  # Integer#hash already implemented for you

end

class Array
  def hash
    total_hash_id = 0
    sorted = self.sort 
    sorted.each_with_index do |ele, i|
      total_hash_id += ele.hash

    end
    total_hash_id
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