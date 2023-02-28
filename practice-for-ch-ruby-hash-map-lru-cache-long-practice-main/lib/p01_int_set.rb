class MaxIntSet

  attr_reader :store
  def initialize(max)
    @max = max
    @store = Array.new(max, false) 
  end

  def insert(num)
    raise "Out of bounds" if !is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private
  attr_reader :max

  def [](num)
    @store[num]
  end

  def is_valid?(num)
    num > 0 && num < max
  end

  def validate!(num)
    #call is_valid? and checks against max num
  end

end

class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    # @store.insert(num, true)
    @store << num
  end

  def remove(num)
    @store.delete(num)
  end

  def include?(num)
    @store.include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
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
    if self.num_buckets == self.count
      self.resize!
    end
    mod_res = num % num_buckets 
    
    if !self[mod_res].include?(num)
      self[mod_res] << num 
      @count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete_if {|ele| ele == num}
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    array = @store.dup.flatten
    doubler = Array.new(num_buckets) {Array.new}
    @store.concat(doubler) 
    k = self.num_buckets
    array.each do |ele|
      bucket_idx = ele % k 
      self[bucket_idx] << ele if !self.include?(ele)
    end
  end

  # def []=(idx, val)
  #   @store[idx] += val
  # end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end
end