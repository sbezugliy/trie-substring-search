# ACT module
module ACT
  require 'act/vertex'

  ##
  # Main class for creating Aho-Corasick Trie from array of words of dictionary
  class Trie
    ##
    # Root vertex
    attr_reader :root
    ##
    # Dictionary attribute
    attr_reader :dictionary
    ##
    # Trie attribute
    attr_reader :trie
    
    ##
    # Initialize new trie and fill it with words from dictionary
    #
    # Remarks:
    # * dictioanry is array of characters
    # * if indexing is important array should not be sorted
    # * word from sentence may contain spaces and special characters, so
    #   one "word" can be the whole sentence
    # * word can be an integer, but result will be converted to the string
    def initialize(dictionary)
      @root = ACT::Vertex.new
      @dictionary = dictionary
      @trie = build_trie
    end

    ##
    # Executes text analyze and returns map occurring words with indexes from dictionary
    def parse(text)
      text = text.to_s.split('')
      vm = vertex_map(text) { :vertex }
      exec_branches(text, vm).flatten.compact
    end

    ##
    # Returns hash with word and indexes at dictionary
    # * Ending vertex of chain should be used as argument, it means that it should 
    #   contain at least one value in the array of end_indexes attribute
    def backtrace_to_word(vertex)
      if vertex.end_indexes.empty?
        raise 'Argument should be ending vertex of chain, and contain at'\
              'least one value in the array of end_indexes attribute'
      else
        chain = backtrace(vertex)
        {
          word: chain.reduce('') { |acc, v| acc << v.char },
          indexes: chain.last.end_indexes
        }
      end
    end

    ##
    # Adds additional words(chains of vertexes) to the trie object
    # * Argument should be array of words
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
        word = word.to_s
        word.to_s.each_char.with_index do |char, char_index|
          end_index = char_index == (word.length - 1) ? index : nil
          @vertex = (char_index.zero? ? @root : parent)
          parent = @vertex.add_child(char, end_index)
        end
      end
      @root
    end
  end
end
