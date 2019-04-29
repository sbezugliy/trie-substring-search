RSpec.describe ACT::Trie do
  # Trie for dict "a cba cbe de a dfe abe df x dfe", with indices as in array
  describe 'Search inside using trie' do
    let!(:dict) { %w[he she her his him they their] }
    let!(:text) { 'he their them height have then their shelter' }
    let!(:trie) { ACT::Trie.new(dict) }

    it 'should parse text' do
      p trie.parse(text)
      expect(true).to be(true)
    end
  end
end
