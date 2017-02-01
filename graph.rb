class AdjacentListNode

  attr_accessor :node, :next

  def initialize(destination)
    @node = node
    @next = nil
  end
end

class AdjacentList

  attr_accessor :adjacents

  def initialize
    @adjacents = []
  end
end

class Graph

  attr_accessor :vertices_count, :array

  def initialize(vertices_count)
    @vertices_count = vertices_count
  end

  def self.create_graph(vertices_count)
    graph = Graph.new(vertices_count)
    graph.array = Array.new(vertices_count)

    i = 0

    while(i < vertices_count)
      graph.array[i] = AdjacentList.new
      i += 1
    end

    graph
  end

  def add_edge(source, destination)
    if !array[source].adjacents.include?(destination)
      @array[source].adjacents << destination
      @array[destination].adjacents << source
    end
    # new_node = AdjacentListNode.new(destination)
    # new_node.next = self.array[source].head
    # @array[source].head = new_node

    # new_node = AdjacentListNode.new(source)
    # new_node.next = self.array[destination].head
    # @array[destination].head = new_node
  end

  def print_graph
    i = 0
    while( i < vertices_count)
      puts "Adjacency list of vertex #{i} -> #{array[i].adjacents.join(' -> ')}"
      i += 1
    end
  end














end
