# frozen_string_literal: true

# RSpec.describe ACT::Trie do
#   # Trie for dict "a cba cbe de a dfe abe df x dfe", with indices as in array
#   describe 'Search inside using trie' do
#     let(:fixt_path) { RSpec.configuration.fixtures_path }
#     let!(:dictionary) { File.open(File.join(fixt_path, 'dictionary.dat'))
#                         .read.split(' ') }
#     let!(:health_data) { File.open(File.join(fixt_path, 'health_data.dat'))
#                         .read.split(' ').map(&:to_i) }
#     let!(:sentences) { File.open(File.join(fixt_path, 'sentences.dat'))
#                         .read.split("\n").map { |s| s.split(' ') } }
#     let(:act) { ACT::Trie.new(dictionary) }
#     xit 'should build trie' do
#       expect(act).to be_an_instance_of(ACT::Trie)
#       expect(act.trie).to be_an_instance_of(ACT::Vertex)
#     end
#     xit 'should parse sentence' do
#       healthes = []
#       sentences.each do |sentence|
#         healthes << act.parse(sentence[2]).map { |w| w[:indexes] }
#                                           .flatten.reduce(0) do |acc, n|
#           if (n >= sentence[0].to_i) && (n <= sentence[1].to_i)
#             acc += health_data.fetch(n)
#           else
#             acc
#           end
#         end
#       end
#       expect(healthes.min).to eq(0)
#       expect(healthes.max).to eq(1_960_904_399)
#     end
#   end
# end
