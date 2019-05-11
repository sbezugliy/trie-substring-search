lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require './lib/tss/version'
require './lib/tss/tss'
require './lib/tss/trie'
require './lib/tss/tries/base'
require './lib/tss/tries/ac'
require './lib/tss/tries/full'
require './lib/tss/tries/flat'
require './lib/tss/vertex'
Gem::Specification.new do |spec|
  spec.name          = 'trie-substring-search'
  spec.version       = TSS::VERSION
  spec.authors       = ['Sergey Bezugliy']
  spec.email         = ['s.bezugliy@gmail.com']
  spec.homepage      = 'https://codenv.top/projects/trie-substring-search'
  spec.summary       = 'Trie based substring search algorithm implementation'
  spec.license       = 'Apache-2.0'
  spec.description   = <<-DESCRIPTION
    This gem provides ruby library with algorithms for trie based
    substring search.
  DESCRIPTION
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host']  = 'https://rubygems.org'

    spec.metadata['homepage_uri']       = spec.homepage
    spec.metadata['source_code_uri']    = 'https://github.com/sbezugliy/trie-substring-search'
    # spec.metadata['changelog_uri']      = 'https://github.com/sbezugliy/trie-substring-search/changelog.md'
  else
    raise 'RubyGems 2.0 or newer is required to protect against' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17.0'
  spec.add_development_dependency 'codecov', '~> 0.1'
  spec.add_development_dependency 'pry', '~> 0.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-benchmark', '~> 0.5.0'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1.1.0'
  spec.add_development_dependency 'rubocop', '~> 0.67.0'
  spec.add_development_dependency 'rubocop-performance', '~> 1.1.0'
  spec.add_development_dependency 'simplecov', '~> 0.16.0'
  spec.add_development_dependency 'simplecov-console', '~> 0.4.0'
end
