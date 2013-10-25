require 'rake/testtask'
require_relative 'node.rb'
require_relative 'dijkstra.rb'
require_relative 'graph.rb'
require_relative 'edge.rb'

Rake::TestTask.new("test:all") do |t|
  t.libs = ["specs"]
  t.verbose = true
  t.warning = true
  t.test_files = FileList['specs/*_spec.rb']
end

Rake::TestTask.new("test:dijkstra") do |t|
  t.libs = ["specs"]
  t.verbose = true
  t.warning = true
  t.test_files = FileList['specs/dijkstra_spec.rb']
end

Rake::TestTask.new("test:edge") do |t|
  t.libs = ["specs"]
  t.verbose = true
  t.warning = true
  t.test_files = FileList['specs/edge_spec.rb']
end

desc "Run shortest path"
task(:example) do
  graph = Graph.new
  graph.add_nodes [ Node.new(1), Node.new(2), Node.new(3), Node.new(4), Node.new(5), Node.new(6) ]
  graph.add_conection graph.g[1], graph.g[2], 7
  graph.add_conection graph.g[1], graph.g[3], 9
  graph.add_conection graph.g[1], graph.g[6], 14
  graph.add_conection graph.g[2], graph.g[3], 10
  graph.add_conection graph.g[2], graph.g[4], 15
  graph.add_conection graph.g[3], graph.g[4], 11
  graph.add_conection graph.g[3], graph.g[6], 2
  graph.add_conection graph.g[4], graph.g[5], 6
  graph.add_conection graph.g[5], graph.g[6], 9

  dijkstra = Dijkstra.new
  puts dijkstra.make_path(graph.g[1], graph.g[5])
end

Rake::TestTask.new("test:graph") do |t|
  t.libs = ["specs"]
  t.verbose = true
  t.warning = true
  t.test_files = FileList['specs/graph_spec.rb']
end

Rake::TestTask.new("test:node") do |t|
  t.libs = ["specs"]
  t.verbose = true
  t.warning = true
  t.test_files = FileList['specs/node_spec.rb']
end