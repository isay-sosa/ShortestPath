class Node
  attr_accessor :key, :value, :is_enable, :neighbors, :procedence

  def initialize(key)
    @key = key
    @value = 0
    @is_enable = true
    @procedence = nil
    @neighbors = []
  end

  def enabled?
    @is_enable
  end
end