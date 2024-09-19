# Graph class
require './lib/node'
require './lib/creatable_chessboard'

class Graph
  include CreatableChessBoard

  attr_accessor :nodes

  def initialize
    @nodes = {}  
  end

  def add_node(node)
    @nodes[node.coordinates] = node
  end

  def add_edge(node1, node2)
    @nodes[node1].add_edge(@nodes[node2])
    # @nodes[node2].add_edge(@nodes[node1])
  end

  #  doesn't work as intended
  def print_graph
    @nodes.each do |position, node|
      puts "#{position} : #{node.print_moves.select {|node| node.coordinates}}"
    end
    return nil
  end
end