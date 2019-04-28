module ACT
  require 'act/vertex'
  class Trie
    attr_reader :root, :dict, :trie

    def initialize(dict)
      @dict = dict
      @trie = build_trie()
    end

    private 

    def build_trie()
      root = ACT::Vertex.new
      parent = root
      @dict.each_with_index do |entity, index|
        entity.each_char.with_index do |char, char_index|
          if char_index == 0
            parent = root
          end
          end_index = nil
          end_index = index if char_index == entity.length - 1
          parent = parent.add_child(char, end_index)
        end
      end
      root
    end
  end
end