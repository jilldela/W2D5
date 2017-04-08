class MaxIntSet
  def initialize(max)
    @store = Array.new(max) { Array.new }
  end

  def insert(num)
    raise "Out of bounds" unless num.between?(0, @store.count)
    @store[num] << num
  end

  def remove(num)
    @store[num] = []
  end

  def include?(num)
    @store[num] == [num] ? true : false
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num] = num
  end

  def remove(num)
    @store.delete(num)
  end

  def include?(num)
    @store[num] == num ? true : false
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
    @count += 1
    resize! if @count > num_buckets
    @store[num] = num
  end

  def remove(num)
    @store[num] = []
  end

  def include?(num)
    @store[num] == num ? true : false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    num_buckets.times { @store << [] }
  end
end
