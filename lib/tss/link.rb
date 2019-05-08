module TSS
  ##
  # Class representing links(suffixes) between vertexes
  class Link
    ##
    # Linked vertex
    attr_accessor :vertex
    ##
    # Character to simplify search
    attr_reader :char
    ##
    # Index of word in dictionary if vertex is ending, or nil if vertex is suffix
    attr_accessor :end_index

    ##
    # Create new ACT::Link object
    def initialize(vertex, end_index = nil)
      @vertex = vertex
      @char = @vertex.char
      @end_index = end_index
    end
  end
end
