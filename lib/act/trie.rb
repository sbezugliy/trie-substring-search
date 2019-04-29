# ACT module
module ACT
  require 'act/vertex'

  # Main class for creating Aho-Corasick Trie from array of words of dictionary
  class Trie
    attr_reader :root, :dict, :trie
    attr_accessor :text
    def initialize(dict)
      @root = ACT::Vertex.new
      @dict = dict
      @trie = build_trie
    end

    def parse(text)
      text = text.split('')
      search_text(text).flatten
    end

    def backtrace_to_word(vertex)
      chain = backtrace(vertex)
      {
        word: chain.reduce('') { |acc, v| acc << v.char },
        indexes: chain.last.end_indexes
      }
    end

    private

    def search_text(text)
      result = []
      text.dup.each do |char|
        text = text[1..-1] if text
        result << search_next(char, text)
      end
      result
    end

    def search_next(char, text)
      vertex = @trie
      result = []
      start_vertex = vertex.get_child(char)
      return result unless start_vertex

      result << backtrace_to_word(start_vertex) if end_vertex?(start_vertex)
      return result if start_vertex.children.empty?

      ending = search_rest(start_vertex, text)
      !ending.empty? ? (result + ending) : result
    end

    def search_rest(vertex, text)
      result = []
      text.each do |char|
        current_vertex = vertex.get_child(char)
        break if current_vertex.nil?

        result << backtrace_to_word(current_vertex) if end_vertex?(current_vertex)
        break if current_vertex.children.empty?

        vertex = current_vertex
      end
      result
    end

    def end_vertex?(vertex)
      !vertex.end_indexes.empty?
    end

    def backtrace(vertex)
      result = !vertex.nil? ? [vertex] : []
      until vertex.parent.nil?
        result << vertex.parent unless vertex.parent.char.nil?
        vertex = vertex.parent
      end
      result.reverse
    end

    def build_trie
      parent = @root
      @dict.each_with_index do |word, index|
        word.each_char.with_index do |char, char_index|
          end_index = char_index == (word.length - 1) ? index : nil
          @vertex = (char_index.zero? ? @root : parent)
          parent = @vertex.add_child(char, end_index)
        end
      end
      @root
    end
  end
end
