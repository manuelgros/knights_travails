# main file
require './lib/node'
require './lib/graph'

graph = Graph.new
graph.set_up
graph.knight_moves([3,3], [4,3])