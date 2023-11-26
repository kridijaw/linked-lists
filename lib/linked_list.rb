# frozen_string_literal: false

require_relative './node'

# https://www.theodinproject.com/lessons/ruby-linked-lists

#------------------------------------------------------------------------------#
# Todo LinkedList Methods:

# extra:
# #insert_at(value, index) that inserts a new node with
# the provided value at the given index.
# cave: update #next_node link for affected nodes

# #remove_at(index) that removes the node at the given index.
# cave: update #next_node link for affected nodes
#------------------------------------------------------------------------------#

# Linear collection of data elements (nodes) which
# point to the next node by means of a pointer.
# [ NODE(head) ] -> [ NODE ] -> [ NODE(tail) ] -> nil
class LinkedList
  attr_accessor :head_node

  # Initialize with nil valued head node.
  def initialize
    @head_node = Node.new
  end

  # Adds a new node containing value to the end of the list.
  def append(value)
    if @head_node.value.nil?
      @head_node = Node.new(value)
    else
      tail.next_node = Node.new(value)
    end
  end

  # Adds a new node containing value to the start of the list.
  def prepend(value)
    @head_node = @head_node.value.nil? ? Node.new(value) : Node.new(value, head)
  end

  # Returns the total number of nodes in the list.
  def size
    i = 0
    return 0 if @head_node.value.nil?

    selected_node = @head_node
    while selected_node.is_a?(Node)
      selected_node = selected_node.next_node
      i += 1
    end
    i
  end

  # Returns the node at the given index.
  def at(index)
    i = 0
    selected_node = @head_node
    while selected_node.is_a?(Node)
      return selected_node if index == i

      selected_node = selected_node.next_node
      i += 1
    end
    selected_node
  end

  # Returns true if value is in the list and otherwise returns false.
  def contains?(value)
    selected_node = @head_node
    while selected_node.is_a?(Node)
      return true if value == selected_node.value

      selected_node = selected_node.next_node
    end
    false
  end

  # Returns the index of the node containing value or nil if not found.
  def find(value)
    i = 0
    selected_node = @head_node
    while selected_node.is_a?(Node)
      return i if value == selected_node.value

      selected_node = selected_node.next_node
      i += 1
    end
  end

  # Represent LinkedList objects as strings.
  # Format: ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    i = 0
    selected_node = @head_node
    output = "( #{selected_node.value} )"
    while selected_node.next_node.is_a?(Node)
      selected_node = selected_node.next_node
      output = "#{output} -> ( #{selected_node.value} )"
      i += 1
    end
    "#{output} -> nil"
  end

  #  Removes the last element from the list.
  def pop
    selected_node = @head_node
    until selected_node.next_node.nil?
      prev_node = selected_node
      selected_node = selected_node.next_node
    end

    selected_node.value = nil
    selected_node.next_node = nil

    @head_node ? return : prev_node.next_node = nil
  end

  # Returns the first node in the list.
  def head
    @head_node
  end

  # Returns the last node in the list.
  def tail
    selected_node = @head_node
    selected_node = selected_node.next_node until selected_node.next_node.nil?
    selected_node
  end
end

list = LinkedList.new
list.prepend('node1') # 1
list.append('node2')  # 1 -> 2
list.prepend('node0') # 0 -> 1 -> 2
list.append('node3')  # 0 -> 1 -> 2 -> 3
# p '----'
# p list.head_node.value
p list
# p list.tail
# p list.tail.instance_variables
# p list.tail
# list.remove_instance_variable
