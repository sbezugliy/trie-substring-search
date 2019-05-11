# frozen_string_literal: true

RSpec.describe TSS::Vertex do
  # Creating chain of vertex for cba word with index 7
  # ("c", nil) -> ("b", nil) -> ("a", 7)
  describe 'Linear vertices in trie' do
    let!(:root) { TSS::Vertex.new }
    let!(:c_vert) { root.add_child('c', nil) }
    let!(:b_vert) { c_vert.add_child('b', nil) }
    let!(:a_vert) { b_vert.add_child('a', 7) }
    it 'child vertices should be instances of TSS::Vertex, so exist' do
      expect(c_vert).to be_an_instance_of(TSS::Vertex)
      expect(b_vert).to be_an_instance_of(TSS::Vertex)
      expect(a_vert).to be_an_instance_of(TSS::Vertex)
    end

    it 'nesting root -> c_vert is correct' do
      expect(root.children).to include(c_vert)
      expect(c_vert.parent).to be(root)
    end

    it 'nesting c_vert -> b_vert is correct' do
      expect(c_vert.children).to include(b_vert)
      expect(b_vert.parent).to be(c_vert)
    end

    it 'nesting b_vert -> a_vert is correct' do
      expect(b_vert.children).to include(a_vert)
      expect(a_vert.parent).to be(b_vert)
    end

    it 'chars of all vertices should be correct' do
      expect(root.char).to be_nil
      expect(c_vert.char).to eq('c')
      expect(b_vert.char).to eq('b')
      expect(a_vert.char).to eq('a')
    end

    it 'only last vertice of trie should contain end_index' do
      expect(root.end_indexes).to be_empty
      expect(c_vert.end_indexes).to be_empty
      expect(b_vert.end_indexes).to be_empty
      expect(a_vert.end_indexes).to include(7)
    end
  end
end
