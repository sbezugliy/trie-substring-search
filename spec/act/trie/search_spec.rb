RSpec.describe ACT::Trie do
  # Trie for dict "a cba cbe de a dfe abe df x dfe", with indices as in array
  describe 'Search inside using trie' do
    let!(:dict) { %w[he she her his him he they their she] }
    let!(:text) { 'he their them height have then their shelter' }
    let!(:trie) { ACT::Trie.new(dict) }
    let!(:result) {
      [ {:word=>"he", :indexes=>[0, 5]},
        {:word=>"their", :indexes=>[7]},
        {:word=>"he", :indexes=>[0, 5]},
        {:word=>"he", :indexes=>[0, 5]},
        {:word=>"he", :indexes=>[0, 5]},
        {:word=>"he", :indexes=>[0, 5]},
        {:word=>"their", :indexes=>[7]},
        {:word=>"he", :indexes=>[0, 5]},
        {:word=>"she", :indexes=>[1, 8]},
        {:word=>"he", :indexes=>[0, 5]}]
    }

    it 'should parse text' do
      expect(trie.parse(text)).to eq(result)
    end
  end
end
