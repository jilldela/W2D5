class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    prev_node = self.prev
    next_node = self.next
    if prev_node.nil?
      next_node.prev = prev_node
    else
      prev_node.next = next_node
      next_node.prev = prev_node
    end
  end
end

class LinkedList
  include Enumerable

  attr_accessor :head, :tail

  def initialize
    @head, @tail = nil, nil
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    @head.nil? && @tail.nil?
  end

  def get(key)
    self.each do |link|
      return link.val if link.key == key
    end

    nil
  end

  def include?(key)
    self.each do |link|
      return true if link.key == key
    end

    false
  end

  def append(key, val)
    new_link = Link.new(key, val)
    if @head.nil?
      @head = new_link
      @tail = @head
    else
      @tail.next = new_link
      new_link.prev = @tail
      @tail = new_link
    end
  end

  def update(key, val)
    self.each do |link|
      link.val = val if link.key == key
    end
  end

  def remove(key)
    self.each do |link|
      if link.key == key && link == @head
        @head = link.next
        link.remove
      elsif link.key == key
        link.remove
      end
    end
  end

  def each
    current_node = @head

    until current_node.nil?
      yield(current_node)
      current_node = current_node.next
    end

    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
