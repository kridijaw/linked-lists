# frozen_string_literal: true

require_relative 'lib/linked_list'
require_relative 'lib/display'

list = LinkedList.new
list.prepend('node1')
puts list                     # 1 -> nil
list.append('node2')
puts list                     # 1 -> 2 -> nil
list.prepend('node0')
puts list                     # 0 -> 1 -> 2 -> nil
list.append('node3')
puts list                     # 0 -> 1 -> 2 -> 3 -> nil
puts "list has #{list.size} nodes."
list.insert_at('nodeX', 1)
puts list                     # 0 -> x -> 1 -> 2 -> 3 -> nil
list.remove_at(2)
puts list                     # 0 -> x -> 2 -> 3 -> nil
puts list.at(0) == list.head  # true
puts list.at(3) == list.tail  # true
puts "nodeX was found at index #{list.find('nodeX')}"
puts "'node3' in list? => #{list.contains?('node3')}"
puts list                     # 0 -> x -> 2 -> 3 -> nil
list.pop
puts list                     # 0 -> x -> 2 -> nil
puts "'node3' in list? => #{list.contains?('node3')}" # false
