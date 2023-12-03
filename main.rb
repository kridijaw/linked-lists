# frozen_string_literal: true

require_relative 'lib/linked_list'
require_relative 'lib/display'

# Test1 - Happy path
list = LinkedList.new
list.prepend('node1')
puts list
# => ( node1 ) -> nil
list.append('node2')
puts list
# => ( node1 ) -> ( node2 ) -> nil
list.prepend('node0')
puts list
# => ( node0 ) -> ( node1 ) -> ( node2 ) -> nil
list.append('node3')
puts list
# => ( node0 ) -> ( node1 ) -> ( node2 ) -> ( node3 ) -> nil
puts "list has #{list.size} nodes."
# => list has 4 nodes.
list.insert_at('nodeX', 1)
puts list
# => ( node0 ) -> ( nodeX ) -> ( node1 ) -> ( node2 ) -> ( node3 ) -> nil
list.remove_at(2)
puts list
# => ( node0 ) -> ( nodeX ) -> ( node2 ) -> ( node3 ) -> nil
puts list.at(0) == list.head
# => true
puts list.at(3) == list.tail
# => true
puts "nodeX was found at index #{list.find('nodeX')}"
# => nodeX was found at index 1
puts "'node3' in list? => #{list.contains?('node3')}"
# => 'node3' in list? => true
puts list
# => ( node0 ) -> ( nodeX ) -> ( node2 ) -> ( node3 ) -> nil
list.pop
puts list
# => ( node0 ) -> ( nodeX ) -> ( node2 ) -> nil
puts "'node3' in list? => #{list.contains?('node3')}"
# => false

# Test2 - Scary Path
# Provoke Error messages: Empty list
# list2 = LinkedList.new
# list2.size                # => Error: Empty list
# list2.head                # => Error: Empty list
# list2.tail                # => Error: Empty list
# list2.at(0)               # => Error: Empty list
# list2.contains?('ABC')    # => Error: Empty list
# list2.find('ABC')         # => Error: Empty list
# list2.pop                 # => Error: Empty list
# list2.remove_at(0)        # => Error: Empty list
# list2.insert_at('ABC', 0) # => Error: Empty list

# Test3 - Scary Path
# Provoke Error messages: Index out of range
# list3 = LinkedList.new
# list3.prepend('A')
# list3.at(1)               # => Error: Index out of range
# list3.insert_at('B', 2)   # => Error: Index out of range
# list3.remove_at(1)        # => Error: Index out of range

# Test4 - Scary Path
# Provoke Error messages: Node not in list
# list4 = LinkedList.new
# list4.prepend('Alpha')
# list4.find('Beta')        # => Error: Node not in list
