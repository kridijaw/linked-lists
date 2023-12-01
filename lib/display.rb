# frozen_string_literal: true

# Error messages
module Display
  def error_empty_list
    abort 'Error: Empty list'
  end

  def error_index_out_of_range
    abort 'Error: Index out of range'
  end

  def error_node_not_in_list
    abort 'Error: Node not in list'
  end
end
