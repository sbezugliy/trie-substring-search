# frozen_string_literal: true

# TSS module
module TSS
  ##
  # Main class for creating Trie Substring Search from array of words of
  # dictionary
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
    # Trie class reference switched by type
    attr_reader :trie_class
    ##
    # Trie class instance
    attr_reader :trie_instance

    ##
    # Initialize new trie and fill it with words from dictionary
    def initialize(dictionary, type = :full)
      switch_trie_type(type)
      @root = TSS::Vertex.new
      @dictionary = dictionary
      build_trie
    end

    ##
    # Executes text analyzis and returns map occurring words with indexes from
    # dictionary
    def parse(text)
      @trie_instance.parse(text)
    end

    ##
    # Returns hash with word and indexes at dictionary
    # * Ending vertex of chain should be used as argument, it means that it
    #   should contain at least one value in the array of end_indexes attribute
    def backtrace_to_word(vertex)
      @trie_instance.backtrace_to_word(vertex)
    end

    ##
    # Adds additional words(chains of vertexes) to the trie object
    # * Argument should be array of words
    # Example:
    #   >> tss.extend_dictionary(["our", "it", "them"])
    def extend_dictionary(dict)
      @trie_instance.extend_dictionary(dict)
    end

    private

    def build_trie
      @trie_instance = @trie_class.new(@dictionary, @root)
    end

    def switch_trie_type(type)
      @trie_class = TSS::Tries.const_get(trie_symbol(type), @root)
    end

    def trie_symbol(type)
      return :Full if type == :full
      # return :AC if type == :aho_corasick
      # return :Flat if type == :flat

      raise ArgumentError, 'Wrong trie type. Possible is: :full, :flat or \
      :aho_corasick'
    end
  end
end
