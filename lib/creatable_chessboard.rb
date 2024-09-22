# Module to create a 'chess board' with the Graph class
module CreatableChessBoard
  def create_chess_board
    arr = Array (0..7)
    coordinates_arr = arr.reduce([]) do |pair_arr, first_ele|
      arr.each { |second_ele| pair_arr << [first_ele, second_ele] }
      pair_arr
    end
    coordinates_arr.each do |coordinate|
      self.add_node(Node.new(coordinate))
    end
  end

  def establish_all_moves(coordinates)
    print self.nodes[coordinates].coordinates # print agument for debugging
    self.add_edge(coordinates, [coordinates[0]+2, coordinates[1]+1]) if self.nodes.include?([coordinates[0]+2, coordinates[1]+1])
    self.add_edge(coordinates, [coordinates[0]+2, coordinates[1]-1]) if self.nodes.include?([coordinates[0]+2, coordinates[1]-1])
    self.add_edge(coordinates, [coordinates[0]+1, coordinates[1]+2]) if self.nodes.include?([coordinates[0]+1, coordinates[1]+2])
    self.add_edge(coordinates, [coordinates[0]+1, coordinates[1]-2]) if self.nodes.include?([coordinates[0]+1, coordinates[1]-2])
    print "FINISH" #for debugging
  end

  def connect_all_nodes
    self.nodes.each_key {|key| self.establish_all_moves(key)}
    print "END" #for debugging
  end

end