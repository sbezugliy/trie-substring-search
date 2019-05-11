# frozen_string_literal: true

##
# TSS module
module TSS
  ##
  # Tries module
  module Tries
    ##
    # Main class for creating Aho-Corasick Trie from array of words of
    # dictionary
    class Base
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
      #
      # Example:
      #   >> TSS.new(["abc", "cde", 8, "ad f", "wer\nm"])
      #
      # Arguments:
      #   dictionary: (Array)
      def initialize(dictionary, root_vertex)
        @root = root_vertex
        @dictionary = dictionary
        @trie = build_trie
      end

      private

      ##
      # Stub superclass method for build_trie
      def build_trie
        @root
      end
    end
  end
end
