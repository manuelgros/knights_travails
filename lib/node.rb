# Node class

class Node
  attr_accessor :coordinates, :possible_moves

  def initialize(coordinates)
    @coordinates = coordinates
    @possible_moves = []
  end

  def add_edge(node)
    @possible_moves << node
  end

  #  doesn't work as intended
  def print_moves
    @possible_moves.each do |neighbour_node|
      print "#{neighbour_node.coordinates} "
    end
    return nil
  end
end