# TSS module
module TSS
  module Tries
    ##
    # Main class for creating Aho-Corasick Trie from array of words of dictionary
    class Flat < Base
      ##
      # Executes text analyze and returns map occurring words with indexes from dictionary

      def parse(_text)
        raise 'WIP'
      end

      ##
      # Returns hash with word and indexes at dictionary
      def backtrace_to_word(_vertex)
        raise 'WIP'
      end

      ##
      # Adds additional words(chains of vertexes) to the trie object
      def extend_dictionay(_dict)
        raise 'WIP'
      end
    end
  end
end
