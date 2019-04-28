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

    private

    def build_trie
      @parent = @root
      @dict.each_with_index do |word, index|
        word.each_char.with_index do |char, char_index|
          end_index = char_index == (word.length - 1) ? index : nil
          @parent = if char_index.zero?  
                      @root.add_child(char, end_index)
                    else
                      @parent.add_child(char, end_index)
                    end
        end
      end
      @root
    end
  end
end
