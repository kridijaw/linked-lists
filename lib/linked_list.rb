# frozen_string_literal: false

require_relative './node'

# Linear collection of data elements (nodes) which
# point to the next node by means of a pointer.
# [ NODE(head) ] -> [ NODE ] -> [ NODE(tail) ] -> nil
class LinkedList
  attr_accessor :head_node

  # Returns a new LinkedList with a nil valued head node.
  def initialize
    @head_node = Node.new
  end

  # Adds a new node with given value to the end of self.
  def append(value)
    if @head_node.value.nil?
      @head_node = Node.new(value)
    else
      tail.next_node = Node.new(value)
    end
  end

  # Adds a new node with given value to the start of self.
  def prepend(value)
    @head_node = @head_node.value.nil? ? Node.new(value) : Node.new(value, head)
  end

  # Returns the total number of nodes of self.
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

  # Returns the node of self at the given Integer index.
  def at(index)
    if (size - 1) < index
      puts 'Error: Index out of list size'
      return
    end
    i = 0
    selected_node = @head_node

    # while selected_node.is_a?(Node)
    until selected_node.next_node.nil?
      return selected_node if index == i

      selected_node = selected_node.next_node
      i += 1
    end
    selected_node
  end

  # Returns true if value is in self and otherwise returns false.
  def contains?(value)
    selected_node = @head_node
    while selected_node.is_a?(Node)
      return true if value == selected_node.value

      selected_node = selected_node.next_node
    end
    false
  end

  # Returns the index of the node with given value of self or nil if not found.
  def find(value)
    i = 0
    selected_node = @head_node
    while selected_node.is_a?(Node)
      return i if value == selected_node.value

      selected_node = selected_node.next_node
      i += 1
    end
  end

  # Returns objects of self as strings in the format:
  # ( value ) -> ( value ) -> ( value ) -> nil
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

  # Inserts node with given value and given Integer index.
  def insert_at(value, index)
    if index == (size + 1)
      append(value)
    elsif index == 0
      prepend(value)
    else

      selected_note = at(index - 1)
      begin
        temp = selected_note.next_node
      rescue StandardError
        puts 'Error: Index bigger than (size of list + 1)'
        return
      end

      new_node = Node.new(value)
      selected_note.next_node = new_node
      new_node.next_node = temp
    end
  end

  # Removes node from self at given Integer index.
  def remove_at(index)
    if size.zero?
      puts 'Error: List is empty'
      return
    end

    if size == 1 && index == 1
      pop
      return
    end

    if index.zero?
      @head_node = @head_node.next_node
    else

      selected_note = at(index - 1)
      begin
        selected_note.next_node = selected_note.next_node.next_node
      rescue StandardError
        puts 'Error: Node is not in the list.'
      end
    end
  end

  # Removes the last element from self.
  def pop
    if @head_node.value.nil?
      puts 'Error: List is empty'
      return
    end

    selected_node = @head_node
    until selected_node.next_node.nil?
      prev_node = selected_node
      selected_node = selected_node.next_node
    end

    selected_node.value = nil
    selected_node.next_node = nil

    selected_node == @head_node ? return : prev_node.next_node = nil
  end

  # Returns the first node of self.
  def head
    @head_node
  end

  # Returns the last node of self.
  def tail
    selected_node = @head_node
    selected_node = selected_node.next_node until selected_node.next_node.nil?
    selected_node
  end
end

list = LinkedList.new
list.prepend('node1') # 1
# list.append('node2') # 1 -> 2
# list.prepend('node0') # 0 -> 1 -> 2
# list.append('node3')  # 0 -> 1 -> 2 -> 3 
p list
puts '<---------------->'
list.remove_at(0)
p list
# p list.tail
# p list.tail.instance_variables
# p list.tail
# list.remove_instance_variable

# to do
# list.remove_at(0) if list has 1 element
# list.remove_at(1) if list has 1 element
# list.remove_at(1+) if list has 1 element
# list.remove_at(x+2) if list has x elements => find out how to return error
