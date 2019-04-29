require 'bundler/setup'
require 'rspec/collection_matchers'
require 'simplecov'
require 'simplecov-console'
require 'act/act'
require 'act/trie'
require 'act/vertex'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

SimpleCov.formatter = SimpleCov::Formatter::Console
SimpleCov.start
