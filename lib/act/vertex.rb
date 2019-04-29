# ACT module
module ACT
  # Trie vertex class
  class Vertex
    attr_reader :parent, :children
    attr_accessor :end_indexes, :char

    def initialize(parent = nil)
      @char = nil
      @parent = parent
      @children = []
      @end_indexes = []
    end

    def add_child(char, end_index)
      child = get_child(char)
      if child
        child.end_indexes << end_index unless end_index.nil?
        child
      else
        init_subchild(char, end_index)
      end
    end

    def get_child(char)
      @children.find { |c| c.char == char }
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
