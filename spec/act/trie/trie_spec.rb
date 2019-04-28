RSpec.describe ACT::Trie do
  # Trie for dict ["a", "cba", "cbe", "de", "a", "dfe", "abe", "df", "x"], with indices as in array
  describe 'Trie' do
    let!(:dict){ACT::Trie.new(%w[a cba cbe de a dfe abe df x])}
    let!(:first_level_chars) { %w[a c d x] }
    let!(:a_vert_indexes) { [0, 4] }
    let!(:c_vert_indexes) { [] }
    let!(:d_vert_indexes) { [] }
    let!(:x_vert_indexes) { [8] }

    it 'should be instance of ACT::Trie with trie of ACT::Vertex' do
      expect(dict).to be_an_instance_of(ACT::Trie)
      expect(dict.trie).to be_an_instance_of(ACT::Vertex)
    end

    it 'first level vertexes trie should be with correct chars' do
      
      expect(dict.trie.children.map(&:char)).to eq(first_level_chars)
    end

    # it "nesting b_vert -> e_vert is correct" do
    #   expect(c_vert.childs).to include(e_vert)
    #   expect(e_vert.parent).to be(c_vert)
    # end

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
