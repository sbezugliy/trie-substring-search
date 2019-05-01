# ACT module
module ACT
  require 'act/vertex'

  # Main class for creating Aho-Corasick Trie from array of words of dictionary
  class Trie
    attr_reader :root, :dict, :trie
    attr_accessor :text
    def initialize(dictionary)
      @root = ACT::Vertex.new
      @dictionary = dictionary
      @trie = build_trie
    end

    def parse(text)
      text = text.split('')
      vm = vertex_map(text) { :vertex }
      exec_branches(text, vm).flatten.compact
    end

    def backtrace_to_word(vertex)
      chain = backtrace(vertex)
      {
        word: chain.reduce('') { |acc, v| acc << v.char },
        indexes: chain.last.end_indexes
      }
    end

    def extend_dictionay(dict)
      build_trie(dict)
    end

    private

    def exec_branches(text, vertex_map)
      vertex_map.map do |b|
        b[:indexes].map do |index|
          search(b[:key], text[index + 1..-1])
        end
      end
    end

    def search(vertex, text)
      result = []
      return result unless vertex

      result << backtrace_to_word(vertex) if end_vertex?(vertex)
      return result if vertex.children.empty?

      ending = search_rest(vertex, text)
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

    def vertex_map(text)
      @trie.children.map do |vertex|
        {
          key: vertex.send(yield),
          indexes: text.collect.with_index { |c, i| i if c == vertex.char }.compact
        }
      end
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

    def build_trie(dict = @dictionary)
      parent = @root
      dict.each_with_index do |word, index|
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
