require_relative 'p02_hashing'
require 'byebug'
class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    @count += 1
    resize! if @count > num_buckets
    self[key] << key
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    self[key].delete(key)
  end

  private

  def [](num)
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(2 * num_buckets) { Array.new }

    @store.each do |bucket|
      bucket.each do |el|
        new_key = el.hash % (num_buckets * 2)
        new_store[new_key] << el
      end
    end

    @store = new_store
  end
end
