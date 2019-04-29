# Aho-Corasick Trie Substring Search

[![Build Status](https://cloud.drone.io/api/badges/sbezugliy/aho-corasick-trie-search/status.svg)](https://cloud.drone.io/sbezugliy/aho-corasick-trie-search)

[![Maintainability](https://api.codeclimate.com/v1/badges/a491e842aac7b4f62751/maintainability)](https://codeclimate.com/github/sbezugliy/aho-corasick-trie-search/maintainability)
[![codecov](https://codecov.io/gh/sbezugliy/aho-corasick-trie-search/branch/master/graph/badge.svg)](https://codecov.io/gh/sbezugliy/aho-corasick-trie-search)

### To be done:

    - TODO: Mode providing ability to return whole words, that contain substring from dictionary
    - TODO: Suffix references is not implemented. Just now it contains full syntax tree, so it is less memory efficient then original Aho-Corasick algorithm.
    - TODO: Maybe, will be good to implement next features for trie build stage:
      -  post optimization of vertex connections, creating suffixes
      -  some parallelism
      -  pre optimization of a dictionary.

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
    dictionary = %w[he she her his him they their]
    # Initialize trie
    trie = ACT::Trie.new(dictionary)
    # Parse text and receive array of all occurrences of words in texts with indexes of word in dictionary
    trie.parse("he their them height have then their shelter")
    # Get end vertex of word 'they'
    vertex = trie.get_child('t').get_child('h').get_child('e').get_child('y')
    # get array of indexes of word
    vertex.end_indexes
```

Index of word in dictionary can be used to get relations with additional array with external data(or collection, or can be easily replaced by foreign key in the future). If dictionary contain duplicates, then you will get few indexes in result.

## Development

## Contributing
