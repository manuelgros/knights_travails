# Module to create a 'chess board' with the Graph class
module CreatableChessBoard
  def create_chess_board
    arr = Array (0..7)
    combination_arr = arr.reduce([]) do |pair_arr, first_ele|
      arr.each { |sec_ele| pair_arr << [first_ele, sec_ele] }
      pair_arr
    end
    combination_arr.each do |coordinate|
      self.add_node(Node.new(coordinate))
    end
  end

  # since Graph.add_edge() establishes edge both ways, and because I travers through all positions, I don't need to go both ways (meaningn + and - in first coordinate)
  def create_all_pathways(node)
    self.add_edge(node, [node[0]+2, node[1]+1]) if self.nodes.include?([node[0]+2, node[1]+1])
    self.add_edge(node, [node[0]+2, node[1]-1]) if self.nodes.include?([node[0]+2, node[1]-1])
    self.add_edge(node, [node[0]-2, node[1]+1]) if self.nodes.include?([node[0]-2, node[1]+1])
    self.add_edge(node, [node[0]-2, node[1]-1]) if self.nodes.include?([node[0]-2, node[1]-1])
    self.add_edge(node, [node[0]+1, node[1]+2]) if self.nodes.include?([node[0]+1, node[1]+2])
    self.add_edge(node, [node[0]+1, node[1]-2]) if self.nodes.include?([node[0]+1, node[1]-2])
    self.add_edge(node, [node[0]-1, node[1]+2]) if self.nodes.include?([node[0]-1, node[1]+2])
    self.add_edge(node, [node[0]-1, node[1]-2]) if self.nodes.include?([node[0]-1, node[1]-2])
  end

end