class Node
  attr_accessor :next, :key, :value, :deleted

  def initialize(key, value)
    @key = key
    @value = value
    @deleted = false
  end
end
