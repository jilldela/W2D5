require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    get(key)
  end

  def set(key, val)

    # @store[bucket(key)].update(key, val)
    if @store[bucket(key)].get(key)
      @store[bucket(key)].update(key, val)
    else
      @count += 1
      resize! if count > num_buckets
      @store[bucket(key)].append(key, val)
    end
  end

  def get(key)
    @store[bucket(key)].get(key)
  end

  def delete(key)
    # remove(key)
    set(key, nil)
    @count -= 1
  end

  def each

  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_hash = Array.new(num_buckets * 2) { LinkedList.new }
    @store.each do |bucket|
      bucket.each do |link|
        new_key = link.hash % (num_buckets * 2)
        new_hash[new_key] = link
      end
    end
    @store = new_hash
  end

  def bucket(key)
    key.hash % num_buckets
  end
end
