RSpec.describe ACT::Vertex do
  # Trie for dict [..., "cb", ., "ce"]
  #             -> ("b", 5)
  # ("c", nil)  |
  #             -> ("e", 7)
  describe 'Branched vertices in trie' do
    let!(:root) { ACT::Vertex.new }
    let!(:c_vert) { root.add_child('c', nil) }
    let!(:b_vert) { c_vert.add_child('b', 5) }
    let!(:e_vert) { c_vert.add_child('e', 7) }

    it 'nesting root -> c_vert is correct' do
      expect(root.children).to include(c_vert)
      expect(c_vert.parent).to be(root)
    end

    it 'nesting c_vert -> b_vert is correct' do
      expect(c_vert.children).to include(b_vert)
      expect(b_vert.parent).to be(c_vert)
    end

    it 'nesting b_vert -> e_vert is correct' do
      expect(c_vert.children).to include(e_vert)
      expect(e_vert.parent).to be(c_vert)
    end

    it 'chars of all vertices should be correct' do
      expect(root.char).to be_nil
      expect(b_vert.char).to eq('b')
      expect(e_vert.char).to eq('e')
    end

    it 'only end vertice of trie should contain end_indexes' do
      expect(root.end_indexes).to be_empty
      expect(c_vert.end_indexes).to be_empty
      expect(b_vert.end_indexes).to include(5)
      expect(e_vert.end_indexes).to include(7)
    end

    it 'returns children chars' do
      expect(c_vert.children_chars).to eq(%w[b e])
    end
  end
end
