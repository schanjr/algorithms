class Node
  attr_accessor :next, :key, :value

  def initialize(key, value)
    @key = key
    @value = value
    @deleted = false
  end

  def deleted?
    @deleted
  end

  def delete
    @deleted = true
  end
end
