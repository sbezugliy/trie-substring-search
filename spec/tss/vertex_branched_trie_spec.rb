# frozen_string_literal: true

RSpec.describe TSS::Vertex do
  # Trie for dict [..., "cb", ., "ce"]
  #             -> ("b", 5)
  # ("c", nil)  |
  #             -> ("e", 7)
  describe 'Branched vertices in trie' do
    let!(:root) { described_class.new }
    let!(:c_vert) { root.add_child('c', nil) }
    let!(:b_vert) { c_vert.add_child('b', 5) }
    let!(:e_vert) { c_vert.add_child('e', 7) }

    context 'when nesting root -> c_vert is correct' do
      it { expect(root.children).to include(c_vert) }
      it { expect(c_vert.parent).to be(root) }
    end

    context 'when nesting c_vert -> b_vert is correct' do
      it { expect(c_vert.children).to include(b_vert) }
      it { expect(b_vert.parent).to be(c_vert) }
    end

    context 'when nesting b_vert -> e_vert is correct' do
      it { expect(c_vert.children).to include(e_vert) }
      it { expect(e_vert.parent).to be(c_vert) }
    end

    context 'when chars of all vertices are correct' do
      it { expect(root.char).to be_nil }
      it { expect(b_vert.char).to eq('b') }
      it { expect(e_vert.char).to eq('e') }
    end

    context 'when only end vertice of trie contains end_indexes' do
      it { expect(root.end_indexes).to be_empty }
      it { expect(c_vert.end_indexes).to be_empty }
      it { expect(b_vert.end_indexes).to include(5) }
      it { expect(e_vert.end_indexes).to include(7) }
    end

    it { expect(c_vert.children_chars).to eq(%w[b e]) }
  end
end
