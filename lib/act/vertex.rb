# ACT module
module ACT
  ##
  # Trie vertex class
  class Vertex
    ##
    # Reference to the parent ACT::Vertex
    attr_reader :parent
    ##
    # Array of children ACT::Vertex references, ACT::Vertex
    attr_reader :children
    ##
    # Array of indexes of word in dictionary
    # Empty if it is intermediate ACT::Vertex in chain
    attr_accessor :end_indexes
    ##
    # Letter representing this vertex
    attr_accessor :char

    ##
    # Initializes new vertex
    # * +parent+ is parent ACT::Vertex
    # Example:
    #   >> ACT::Vertex.new(@root_vertex)
    #   >> ACT::Vertex.new(@root_vertex)
    # Optional arguments:
    #   parent: (ACT::Vertex)
    def initialize(parent = nil)
      @char = nil
      @parent = parent
      @children = []
      @end_indexes = []
    end

    ##
    # Initializes new ACT::Vertex and adds it to the parent attribute
    def add_child(char, end_index)
      child = get_child(char)
      if child
        child.end_indexes << end_index unless end_index.nil?
        child
      else
        init_subchild(char, end_index)
      end
    end

    ##
    # Returns child ACT::Vertex by letter, from children attribute 
    def get_child(char)
      @children.find { |c| c.char == char }
    end

    ##
    # Returns array of characters from array of children ACT::Vertex
    def children_chars
      @children.map(&:char)
    end

    private

    def vertex
      self
    end

    def init_subchild(char, end_index)
      child = self.class.new(self)
      child.char = char
      child.end_indexes << end_index unless end_index.nil?
      @children << child
      child
    end
  end
end
