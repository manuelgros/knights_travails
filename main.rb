# main file
require './lib/node'
require './lib/graph'

graph = Graph.new
graph.create_chess_board
graph.connect_all_nodes
graph.knight_moves([3,3], [7,5])