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

  # def bfs(start, par, dist)
  #   queue = []
  #   dist[start] = 0
  #   queue.push(start)

  #   until queue.empty?
  #     active_node = queue.shift

  #     for neighbor in self.nodes[active_node].possible_moves
  #       if dist[neighbor.coordinates] == Float::INFINITY
  #         par[neighbor.coordinates] = active_node
  #         dist[neighbor.coordinates] = dist[active_node] + 1
  #         queue.push(neighbor.coordinates)
  #       end
  #     end
  #   end
  # end

  def knight_moves(start, destination)
    return 'Destination is outside the board' unless self.nodes.keys.include?(destination)

    queue = [start]
    par = {}
    dist = {}
    self.nodes.keys.each do |node_coordinate| 
      dist[node_coordinate] = Float::INFINITY
      par[node_coordinate] = nil
    end
    dist[start] = 0

    until queue.empty? do
      active_node = queue.shift
      self.nodes[active_node].possible_moves.each do |neighbor|
        if dist[neighbor.coordinates] == Float::INFINITY
          par[neighbor.coordinates] = active_node
          dist[neighbor.coordinates] = dist[active_node] + 1
          queue.push(neighbor.coordinates)
        end
      end
    end

    path = []
    current_node = destination
    path.push(destination)
    while par[current_node] != nil
      path.push(par[current_node])
      current_node = par[current_node]
    end
    puts "The knight can reach #{destination} in #{path.size-1} moves."
    puts "The path is:"
    puts "Start:  #{path.reverse[0]}"
    path.reverse.each_with_index { |step, idx| puts "Move #{idx}: #{step}" unless idx == 0 }
  end

end