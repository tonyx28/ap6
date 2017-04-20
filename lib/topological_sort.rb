require_relative 'graph'
require 'byebug'
# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  queue = []

  vertices.each do |vertex|
    if vertex.in_edges.empty?
      queue.push(vertex)
    end
  end

  until queue.empty?
    current = queue.shift
    sorted << current

    until current.out_edges.length == 0
      vertex = current.out_edges[0].to_vertex
      current.out_edges[0].destroy!
      if vertex.in_edges.empty?
        queue.push(vertex)
      end
    end
  end

  sorted
end
