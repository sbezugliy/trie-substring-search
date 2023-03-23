# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in tss.gemspec
gemspec

gem 'bundler'
gem 'codecov'
gem 'pry'
gem 'rake'
gem 'rspec'
gem 'rspec-benchmark'
gem 'rspec-collection_matchers'
gem 'rubocop'
gem 'rubocop-md'
gem 'rubocop-performance'
gem 'rubocop-rake'
gem 'rubocop-rspec'
gem 'simplecov'
gem 'simplecov-console'

if ENV["GEM_ENV"]=="development"
  gem 'trie-base', path: '../trie-base'
  gem 'trie-structures', path: '../trie-structures'
else
  gem 'trie-base', git: 'https://github.com/sbezugliy/trie-base.git', tag: 'v0.1.1.0'
  gem 'trie-structures', git: 'https://github.com/sbezugliy/trie-structures.git', tag: 'v0.1.1.0'
end