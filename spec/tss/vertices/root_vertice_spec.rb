# frozen_string_literal: true

RSpec.describe TSS::Vertex do
  describe 'Root vertice' do
    let!(:root) { TSS::Vertex.new }

    it 'should be instace of TSS::Vertex' do
      expect(root).to be_an_instance_of(TSS::Vertex)
    end

    it 'should contain initial attributes with correct values' do
      expect(root.char).to be_nil
      expect(root.parent).to be_nil
      expect(root.children).to be_empty
      expect(root.end_indexes).to be_empty
    end
  end
end
