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
    # debugger
    sorted << current
    current.out_edges.each do |edge|
      vertex = edge.to_vertex
      edge.destroy!
      if vertex.in_edges.empty?
        queue.push(vertex) unless queue.include?(vertex)
      end
    end
    vertices.delete(current)
  end

  sorted
end
