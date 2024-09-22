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
    @nodes[node2].add_edge(@nodes[node1])
  end
  
  # Custome .to_s for Graph, using Node .to_s
  def to_s
    self.nodes.each_value {|node| prints node.to_s }
    return nil #otherwise returns Graph object => infinite loop when trying to pint in IRB
  end
end