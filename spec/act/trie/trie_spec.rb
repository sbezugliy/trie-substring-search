RSpec.describe ACT::Trie do
  # Trie for dict ["a", "cba", "cbe", "de", "a", "dfe", "abe", "df", "x"], with indices as in array
  describe 'Trie' do
    let!(:dict){ACT::Trie.new(%w[a cba cbe de a dfe abe df x dfe])}
    let!(:first_level_chars) { %w[a c d x] }
    let!(:a_vert_indexes) { [0, 4] }
    let!(:c_vert_indexes) { [] }
    let!(:d_vert_indexes) { [] }
    let!(:x_vert_indexes) { [8] }
    let!(:cbe_vert_indexes) { [2] }
    let!(:dfe_vert_indexes) { [5, 9] }
    let!(:df_vert_indexes) { [7] }
    
    it 'should be instance of ACT::Trie with trie of ACT::Vertex' do
      expect(dict).to be_an_instance_of(ACT::Trie)
      expect(dict.trie).to be_an_instance_of(ACT::Vertex)
    end

    it 'first level vertexes of trie should be with correct chars' do
      expect(dict.trie.children.map(&:char)).to eq(first_level_chars)
    end

    it 'first level end_indexes of a vertex indexes of trie should correct' do
      expect(dict.trie.get_child('a').end_indexes).to eq(a_vert_indexes)
    end

    it 'first level end_indexes of c vertex indexes of trie should correct' do
      expect(dict.trie.get_child('c').end_indexes).to eq(c_vert_indexes)
    end

    it 'first level end_indexes of d vertex indexes of trie should correct' do
      expect(dict.trie.get_child('d').end_indexes).to eq(d_vert_indexes)
    end

    it 'first level end_indexes of x vertex indexes of trie should correct' do
      expect(dict.trie.get_child('x').end_indexes).to eq(x_vert_indexes)
    end

    it 'first level end_indexes of cbe vertex indexes of trie should correct' do
      expect(dict.trie.get_child('c').get_child('b').get_child('e').end_indexes).to eq(cbe_vert_indexes)
    end

    it 'first level end_indexes of dfe vertex indexes of trie should correct' do
      expect(dict.trie.get_child('d').get_child('f').get_child('e').end_indexes).to eq(dfe_vert_indexes)
    end

    it 'first level end_indexes of df vertex indexes of trie should correct' do
      expect(dict.trie.get_child('d').get_child('f').end_indexes).to eq(df_vert_indexes)
    end

    # it "chars of all vertices should be correct" do
    #   expect(root.char).to be_nil
    #   expect(b_vert.char).to eq("b")
    #   expect(e_vert.char).to eq("e")
    # end

    # it "only two last vertice of trie should contain end_indexes of word in dictionary" do
    #   expect(root.end_indexes).to be_empty
    #   expect(c_vert.end_indexes).to be_empty
    #   expect(b_vert.end_indexes).to include(5)
    #   expect(e_vert.end_indexes).to include(7)
    # end
  end
end
