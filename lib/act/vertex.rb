module ACT
  class Vertex
    attr_reader :parent, :childs
    attr_accessor :end_indexes, :char

    def initialize(root = nil)
      @char=nil
      @parent = root
      @childs = []
      @end_indexes = []
    end

    def add_child(char, end_index)
      if @childs.find{|c| c.char == char} 
        child = self
      else
        child = init_subchild(char)
      end
      child.end_indexes << end_index if end_index
      child
    end
    
    private
    
    def init_subchild(char)
      child = self.class.new(self)
      child.char = char
      @childs << child
      child
    end

  end
end