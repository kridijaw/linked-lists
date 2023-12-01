# frozen_string_literal: true

# Holds a single element of data and
# pointer to the next node in the list.
#
# @attr_accessor value [Object] the value of the node
# @attr_accessor next_node [Node] the next node in the list
class Node
  attr_accessor :value, :next_node

  # Creates a new node with given value and next_node.
  #
  # @param value [Object] the value of the node
  # @param next_node [Node] the next node in the list
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
