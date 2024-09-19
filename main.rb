# main file
require './lib/node'
require './lib/graph'

# Creating the "chess board"
# def create_chess_board(new_graph)
#   arr = Array (0..7)
#   combination_arr = arr.reduce([]) do |pair_arr, first_ele|
#     arr.each { |sec_ele| pair_arr << [first_ele, sec_ele] }
#     pair_arr
#   end
#   combination_arr.each do |coordinate|
#     new_graph.add_node(Node.new(coordinate))
#   end
# end

# my_graph = Graph.new
# my_graph.create_chess_board
# p my_graph

# my_graph.nodes.each_key { |node_key| my_graph.create_all_pathways(node_key) }
# p my_graph