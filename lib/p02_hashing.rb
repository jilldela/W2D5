class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash = 0
    self.each_with_index do |num, idx|
      hash += (num.to_s.to_i * idx)
    end

    hash.hash
  end
end

class String
  def hash
    hash = 0
    self.each_char.with_index do |str, idx|
      hash += (str.ord * idx)
    end

    hash.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.map(&:hash).hash
    # 0
  end
end
