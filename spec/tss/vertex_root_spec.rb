# frozen_string_literal: true

RSpec.describe TSS::Vertex do
  describe 'Root vertice' do
    let!(:root) { described_class.new }

    it 'is instace of TSS::Vertex' do
      expect(root).to be_an_instance_of(described_class)
    end

    context 'when initial attributes are correct' do
      it { expect(root.char).to be_nil }
      it { expect(root.parent).to be_nil }
      it { expect(root.children).to be_empty }
      it { expect(root.end_indexes).to be_empty }
    end
  end
end
