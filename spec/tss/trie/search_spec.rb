# frozen_string_literal: true

RSpec.describe TSS::Trie do
  # Trie for dict "a cba cbe de a dfe abe df x dfe", with indices as in array
  describe 'Search words in text using trie' do
    let!(:dict) { %w[he she her his him he they their she] }
    let!(:text) { 'he their them height have then their shelter' }
    let!(:trie) { TSS::Trie.new(dict, :full) }
    let!(:result) do
      [{ indexes: [0, 5], word: 'he' },
       { indexes: [0, 5], word: 'he' },
       { indexes: [0, 5], word: 'he' },
       { indexes: [0, 5], word: 'he' },
       { indexes: [0, 5], word: 'he' },
       { indexes: [0, 5], word: 'he' },
       { indexes: [0, 5], word: 'he' },
       { indexes: [1, 8], word: 'she' },
       { indexes: [7], word: 'their' },
       { indexes: [7], word: 'their' }]
    end

    it 'should parse text' do
      expect(trie.parse(text)).to eq(result)
    end
  end
end
