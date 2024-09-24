# Module to create a 'chess board' with the Graph class
require 'pry-byebug'

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
    "Done"
  end

  def establish_all_moves(coordinates)
    # print self.nodes[coordinates].coordinates # print agument for debugging
    self.add_edge(coordinates, [coordinates[0]+2, coordinates[1]+1]) if self.nodes.include?([coordinates[0]+2, coordinates[1]+1])
    self.add_edge(coordinates, [coordinates[0]+2, coordinates[1]-1]) if self.nodes.include?([coordinates[0]+2, coordinates[1]-1])
    self.add_edge(coordinates, [coordinates[0]+1, coordinates[1]+2]) if self.nodes.include?([coordinates[0]+1, coordinates[1]+2])
    self.add_edge(coordinates, [coordinates[0]+1, coordinates[1]-2]) if self.nodes.include?([coordinates[0]+1, coordinates[1]-2])
    # print "FINISH" #for debugging
  end

  def connect_all_nodes
    self.nodes.each_key {|key| self.establish_all_moves(key)}
    # print "END" #for debugging
  end

  def knight_moves(start, destination)
    return 'Destination is outside the board' unless self.nodes.keys.include?(destination)

    queue = [start]
    visited = [start]
    par = Hash[self.nodes.keys.map {|coordinate| [coordinate, nil]}]

    until queue.empty? do
      active_node = queue.shift
      self.nodes[active_node].possible_moves.each do |neighbor|
        unless visited.include?(neighbor.coordinates)
          par[neighbor.coordinates] = active_node
          visited.push(neighbor.coordinates)
          queue.push(neighbor.coordinates)
        end
      end
    end

    path = [destination]
    current_position = destination
    while par[current_position] != nil
      path.push(par[current_position])
      current_position = par[current_position]
    end
    puts "The knight can reach #{destination} in #{path.size-1} moves."
    puts "The path is:"
    puts "Start:  #{path.reverse[0]}"
    path.reverse.each_with_index { |step, idx| puts "Move #{idx}: #{step}" unless idx == 0 }
  end
end