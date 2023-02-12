# frozen_string_literal: true

RSpec.describe TSS::Vertex do
  # Creating chain of vertex for cba word with index 7
  # ("c", nil) -> ("b", nil) -> ("a", 7)
  describe 'Linear vertices in trie' do
    let!(:root) { described_class.new }
    let!(:c_vert) { root.add_child('c', nil) }
    let!(:b_vert) { c_vert.add_child('b', nil) }
    let!(:a_vert) { b_vert.add_child('a', 7) }

    context 'when child vertices are instances of TSS::Vertex, so exist' do
      it { expect(c_vert).to be_an_instance_of(described_class) }
      it { expect(b_vert).to be_an_instance_of(described_class) }
      it { expect(a_vert).to be_an_instance_of(described_class) }
    end

    context 'when nesting root -> c_vert is correct' do
      it { expect(root.children).to include(c_vert) }
      it { expect(c_vert.parent).to be(root) }
    end

    context 'when nesting c_vert -> b_vert is correct' do
      it { expect(c_vert.children).to include(b_vert) }
      it { expect(b_vert.parent).to be(c_vert) }
    end

    context 'when nesting b_vert -> a_vert is correct' do
      it { expect(b_vert.children).to include(a_vert) }
      it { expect(a_vert.parent).to be(b_vert) }
    end

    context 'when chars of all vertices are correct' do
      it { expect(root.char).to be_nil }
      it { expect(c_vert.char).to eq('c') }
      it { expect(b_vert.char).to eq('b') }
      it { expect(a_vert.char).to eq('a') }
    end

    context 'when only last vertice of trie contains end_index' do
      it { expect(root.end_indexes).to be_empty }
      it { expect(c_vert.end_indexes).to be_empty }
      it { expect(b_vert.end_indexes).to be_empty }
      it { expect(a_vert.end_indexes).to include(7) }
    end
  end
end
