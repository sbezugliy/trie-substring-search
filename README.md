# Aho-Corasick Trie Substring Search

[![Build Status](https://cloud.drone.io/api/badges/sbezugliy/aho-corasick-trie-search/status.svg)](https://cloud.drone.io/sbezugliy/aho-corasick-trie-search)

[![Maintainability](https://api.codeclimate.com/v1/badges/a491e842aac7b4f62751/maintainability)](https://codeclimate.com/github/sbezugliy/aho-corasick-trie-search/maintainability)
[![codecov](https://codecov.io/gh/sbezugliy/aho-corasick-trie-search/branch/master/graph/badge.svg)](https://codecov.io/gh/sbezugliy/aho-corasick-trie-search)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aho-corasick-trie-search'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aho-corasick-trie-search

## Usage

```ruby
    # Array of words in the dictionary
    dictionary = %w[he she her his him he they their she]
    # Initialize trie
    act = ACT::Trie.new(dictionary)
    # Parse text and receive array of all occurrences of words in texts with indexes of word in dictionary
    act.parse('he their them height have then their shelter')
    # => [{:word=>"he", :indexes=>[0, 5]},
    #  {:word=>"their", :indexes=>[7]},
    #  {:word=>"he", :indexes=>[0, 5]},
    #  {:word=>"he", :indexes=>[0, 5]},
    #  {:word=>"he", :indexes=>[0, 5]},
    #  {:word=>"he", :indexes=>[0, 5]},
    #  {:word=>"their", :indexes=>[7]},
    #  {:word=>"he", :indexes=>[0, 5]},
    #  {:word=>"she", :indexes=>[1, 8]},
    #  {:word=>"he", :indexes=>[0, 5]}]
    # Add additional words to the dictionary
    act.extend_dictionary(["our", "it", "them"])
    # Get end vertex of word 'they'
    vertex = act.trie.get_child('s').get_child('h').get_child('e')
    # => #<ACT::Vertex:0x000055cabb2399d0
    #  @char="e",
    #  @children=[],
    #  @end_indexes=[1, 8],
    #  @parent=
    #   #<ACT::Vertex:0x000055cabb239ac0
    #    @char="h",
    #    @children=[#<ACT::Vertex:0x000055cabb2399d0 ...>],
    #    @end_indexes=[],
    #    @parent=
    #     #<ACT::Vertex:0x000055cabb239bb0
    #      @char="s",
    #      @children=[#<ACT::Vertex:0x000055cabb239ac0 ...>],
    # get array of indexes of word
    vertex.end_indexes
    # => [1, 8]
    # Recover word from trie with indexes in dictionary
    act.backtrace_to_word(vertex)
    # => {:word=>"she", :indexes=>[1, 8]}
```

Index of word in dictionary can be used to get relations with additional array with external data(or collection, or can be easily replaced by foreign key in the future). If dictionary contain duplicates, then you will get few indexes in result.

## Benchmark

    dictionary:                            100000 words
    number of executions with uniq text:   44555
    results of benchmark:

    user       system     total       real
    1.749733   0.116561   1.866294 (  1.876876)

## Development

## Contributing

### TBD Improvements:

    - TODO: Mode providing ability to return whole words, that contain substring from dictionary
    - TODO: Suffix references is not implemented. Just now it contains full syntax tree, so it is less memory efficient then original Aho-Corasick algorithm.
    - TODO: Maybe, will be good to implement next features for trie build stage:
      -  post optimization of vertex connections, creating suffixes
      -  some parallelism
      -  pre optimization of a dictionary.
