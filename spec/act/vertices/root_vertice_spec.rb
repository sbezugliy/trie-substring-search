RSpec.describe ACT::Vertex do
  describe "Root vertice" do
    let!(:root){ACT::Vertex.new}

    it "should be instace of ACT::Vertex" do
      expect(root).to be_an_instance_of(ACT::Vertex)
    end

    it "should contain initial attributes with correct values" do
      expect(root.char).to be_nil
      expect(root.parent).to be_nil
      expect(root.childs).to be_empty
      expect(root.end_indexes).to be_empty
    end
  end
end