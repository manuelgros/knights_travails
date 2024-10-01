# Module to create a 'chess board' with the Graph class
require 'pry-byebug'

module ChessBoard
  def set_up
    self.create_chess_board
    self.connect_all_nodes
    nil
  end

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
    moves = [[2, 1], [2, -1], [1, 2], [1, -2]]
    moves.each do |move|
      x = move[0]
      y = move[1] 
      if self.nodes.include?([coordinates[0] + x, coordinates[1] + y])
        self.add_edge(coordinates, [coordinates[0] + x, coordinates[1] + y])
      end
    end
  end

  def connect_all_nodes
    self.nodes.each_key {|key| self.establish_all_moves(key)}
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