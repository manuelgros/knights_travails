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

  # custome .to_s for Node class
  def to_s
    moves_coordinates_arr = @possible_moves.map { |node| node.coordinates }
    "#{@coordinates} :: #{moves_coordinates_arr}"
  end
end