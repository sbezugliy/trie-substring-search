RSpec.describe TSS::Trie::Full do
  # Trie for dict "a cba cbe de a dfe abe df x dfe", with indices as in array
  describe 'Trie building' do
    let!(:tss) { TSS::Trie.new(%w[a cba cbe de a dfe abe df x dfe], :full) }
    let!(:text) { 'sedateragextrod' }
    let!(:first_level_chars) { %w[a c d x] }
    let!(:a_vert_indexes) { [0, 4] }
    let!(:c_vert_indexes) { [] }
    let!(:d_vert_indexes) { [] }
    let!(:x_vert_indexes) { [8] }
    let!(:cbe_vert_indexes) { [2] }
    let!(:dfe_vert_indexes) { [5, 9] }
    let!(:df_vert_indexes) { [7] }
    let!(:char_map) { [{ key: 'a', indexes: [3, 7] }, { key: 'c', indexes: [] }, { key: 'd', indexes: [2, 14] }, { key: 'x', indexes: [10] }] }

    it 'should be instance of TSS::Trie with trie of TSS::Vertex' do
      expect(tss).to be_an_instance_of(TSS::Trie)
      expect(tss.trie_instance).to be_an_instance_of(TSS::Trie::Full)
      expect(tss.trie).to be_an_instance_of(TSS::Vertex)
    end

    it 'first level vertexes of trie should be with correct chars' do
      expect(tss.trie.children.map(&:char)).to eq(first_level_chars)
    end

    it 'first level end_indexes of a vertex indexes of trie should correct' do
      expect(tss.trie.get_child('a').end_indexes).to eq(a_vert_indexes)
    end

    it 'first level end_indexes of c vertex indexes of trie should correct' do
      expect(tss.trie.get_child('c').end_indexes).to eq(c_vert_indexes)
    end

    it 'first level end_indexes of d vertex indexes of trie should correct' do
      expect(tss.trie.get_child('d').end_indexes).to eq(d_vert_indexes)
    end

    it 'first level end_indexes of x vertex indexes of trie should correct' do
      expect(tss.trie.get_child('x').end_indexes).to eq(x_vert_indexes)
    end

    it 'first level end_indexes of cbe vertex indexes of trie should correct' do
      inds = tss.trie.get_child('c').get_child('b').get_child('e').end_indexes
      expect(inds).to eq(cbe_vert_indexes)
    end

    it 'first level end_indexes of dfe vertex indexes of trie should correct' do
      inds = tss.trie.get_child('d').get_child('f').get_child('e').end_indexes
      expect(inds).to eq(dfe_vert_indexes)
    end

    it 'first level end_indexes of df vertex indexes of trie should correct' do
      inds = tss.trie.get_child('d').get_child('f').end_indexes
      expect(inds).to eq(df_vert_indexes)
    end

    it 'returns children vertex chars' do
      expect(tss.trie.children_chars).to eq(first_level_chars)
    end

    it 'returns array of start char mapping' do
      expect(tss.send(:vertex_map, text.split('')) { :char }).to eq(char_map)
    end

    it 'returns array of start vertices mapping' do
      tss.send(:vertex_map, text.split('')) { :vertex }.each.with_index do |m, i|
        expect(m[:key]).to be_an_instance_of(TSS::Vertex)
        expect(m[:indexes]).to eq(char_map[i][:indexes])
      end
    end

    xit 'should parse text using char map' do
    end

    it 'backtrace should return array of vertexes of word' do
      deep_vertex = tss.trie.get_child('d').get_child('f').get_child('e')
      backtrace = tss.send(:backtrace, deep_vertex)
      expect(backtrace).to all(be_an_instance_of(TSS::Vertex))
      expect(backtrace).to have_exactly(3).items
      expect(backtrace[0].char).to eq('d')
      expect(backtrace[1].char).to eq('f')
      expect(backtrace[2].char).to eq('e')
    end
  end
end
