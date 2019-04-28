# Aho-Corasick Trie Substri Installation

Add this line to your application's Gemfile:

```ruby
gem 'aho-corasick-trie-search'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aho-corasick-trie-search

## To be done:

TODO: Suffix references, now it contain full syntax tree. So just now it is less memory efficient then original Aho-Corasick algorithm
TODO: Maybe need post optimization of vertex connections

## Usage

```ruby
    # Array of words in the dictionary
    dictionary = %w[he she her his him they their]
    # Initialize trie
    trie = ACT::Trie.new(dictionary)
    # Parse text and receive array of all occurrences of words in texts with indexes of word in dictionary
    trie.parse("he their them height have then their shelter")
```

Index of word in dictionary can be used to get use additional array with external data. If dictionary contain duplicates, then you will get few indexes in result.

## Development

## Contributing
