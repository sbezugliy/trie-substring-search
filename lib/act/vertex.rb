# ACT module
module ACT
  # Trie vertex class
  class Vertex
    attr_reader :parent
    attr_accessor :end_indexes, :char, :children

    def initialize(parent = nil)
      @char = nil
      @parent = parent
      @children = []
      @end_indexes = []
    end

    def add_child(char, end_index)
      child = @children.find { |c| c.char == char }
      if child
        @end_indexes << end_index unless end_index.nil?
        child
      else
        init_subchild(char, end_index)
      end
    end

    private

    def init_subchild(char, end_index)
      child = self.class.new(self)
      child.char = char
      child.end_indexes << end_index unless end_index.nil?
      @children << child
      child
    end
  end
end
