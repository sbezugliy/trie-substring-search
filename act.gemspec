lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require './lib/act/version'
require './lib/act/act'
require './lib/act/trie'
require './lib/act/vertex'
Gem::Specification.new do |spec|
  spec.name          = 'aho-corasick-trie-search'
  spec.version       = ACT::VERSION
  spec.authors       = ['Sergey Bezugliy']
  spec.email         = ['s.bezugliy@gmail.com']

  spec.summary       = "'Ruby library realising Aho-Corasick substring'
  'search algorithm'"
  spec.description   = " 'This gem provides ruby library with realisation'
   of Aho-Corasick substring search algorithm, with linear complication.'"
  spec.homepage      = 'https://codenv.top/projects/aho-corasick-trie'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://github.com'

    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/sbezugliy/aho-corasick-trie-search'
    spec.metadata['changelog_uri'] = 'https://github.com/sbezugliy/aho-corasick-trie-search/changelog.md'
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

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'codecov'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1.1.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'simplecov-console'
end
