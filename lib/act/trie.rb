# ACT module
module ACT
  require 'act/vertex'

  # Main class for creating Aho-Corasick Trie from array of words of dictionary
  class Trie
    attr_reader :root, :dict, :trie

    def initialize(dict)
      @root = ACT::Vertex.new
      @dict = dict
      @trie = build_trie
    end

    def parse(text)
      recursive_search do
        text.split(" ").map do |word|
          word.split("")
        end
      end
    end

    private

    def recursive_search
      vertex = @trie
      result_vertices = []
      yield.each do |word|
        sub_vertices = []
        word.each.with_index do |char, index|
          if vertex.get_child(char)
            vertex = vertex.get_child(char)
            sub_vertices << vertex.char
            unless vertex.end_indexes.empty?
              result_vertices << map_from_chain(back_trace(vertex))
            end
          end
        end
      end
      p result_vertices
    end

    def back_trace(vertex)
      result = [vertex]
      while vertex.parent != nil
        result << vertex.parent
        vertex = vertex.parent
      end
      result.reverse
    end

    def map_from_chain(chain)
      chain.map{|vertex| {char: vertex.char, indexes: vertex.end_indexes}}
    end

    def build_trie
      @parent = @root
      @dict.each_with_index do |word, index|
        word.each_char.with_index do |char, char_index|
          end_index = char_index == (word.length - 1) ? index : nil
          @vertex = (char_index.zero? ? @root : @parent)
          @parent = @vertex.add_child(char, end_index)
        end
      end
      @root
    end
  end
end
