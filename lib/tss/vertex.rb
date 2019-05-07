# TSS module
module TSS
  ##
  # Trie vertex class
  class Vertex
    ##
    # Reference to the root vertex of the trie
    attr_accessor :root
    ##
    # Reference to the parent TSS::Vertex
    attr_accessor :parent
    ##
    # Array of children TSS::Vertex references for nested models(full trie, Aho-Corasick trie)
    # or as list of nested vertexes of root vertex of flat trie
    attr_reader :children
    ##
    # Array of TSS::Vertex links for flat trie model, also used as suffixes of Aho-Corasick trie
    attr_reader :links
    ##
    # Array of indexes of word in dictionary
    # Empty if it is intermediate TSS::Vertex in chain
    attr_accessor :end_indexes
    ##
    # Letter representing this vertex
    attr_accessor :char

    ##
    # Initializes new vertex
    # * +parent+ is parent TSS::Vertex
    # Example:
    #   >> TSS::Vertex.new(@root_vertex)
    #   >> TSS::Vertex.new(@root_vertex)
    # Optional arguments:
    #   parent: (TSS::Vertex)
    def initialize(parent = nil)
      @char = nil
      @parent = parent
      @children = []
      @links = []
      @end_indexes = []
      yield(self) if block_given?
    end

    ##
    # Initializes new TSS::Vertex and adds it to the parent attribute
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
    # Returns child TSS::Vertex by letter, from children attribute
    def get_child(char)
      @children.find { |c| c.char == char }
    end

    ##
    # Adds reference to the linked vertexes
    def add_link(vertex, end_index = nil)
      @links << TSS::Link.new(vertex, end_index)
    end

    ##
    # Returns link by character
    def get_link(char)
      @links.find { |l| l.char == char }
    end

    ##
    # Returns array of characters from array of children TSS::Vertex
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
      child.root = @root
      child.end_indexes << end_index unless end_index.nil?
      @children << child
      child
    end
  end
end
