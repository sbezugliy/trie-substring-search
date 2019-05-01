# # TODO: Requires more configuration to take real results
# RSpec.describe 'Performance testing' do
#   include RSpec::Benchmark::Matchers
#   # xlet!(:fixt_path) { RSpec.configuration.fixtures_path }
#   # xlet!(:dictionary) { File.open(File.join(fixt_path, 'dictionary.dat')).read.split(' ') }
#   # xlet!(:mediadescriptor) { File.open(File.join(fixt_path, 'mediadescriptor.dat')).read.split(' ').map(&:to_i) }
#   # xlet!(:sentences) { File.open(File.join(fixt_path, 'sentences.dat')).read.split("\n") }

#   xit 'trie building time' do
#     # expect { ACT::Trie.new(dictionary) }.to perform_under(7).sec
#   end

#   xit 'trie algorithm complexity' do
#     # expect { ACT::Trie.new(dictionary) }.to perform_power
#   end
# end
