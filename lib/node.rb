# frozen_string_literal: false

# Holds a single element of data and pointer to the next node in the list.
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
