# frozen_string_literal: true

RSpec.describe TSS::Vertex do
  describe 'Linked vertexes features' do
    let!(:root_vertex) { TSS::Vertex.new }

    let!(:link_a) do
      link_a = root_vertex.add_child('a', nil)
      link_a.root = root_vertex
      link_a.parent = root_vertex
      link_a
    end

    let!(:link_b) do
      link_b = root_vertex.add_child('b', nil)
      link_b.root = root_vertex
      link_b.parent = root_vertex
      link_b
    end

    let!(:link_c) do
      link_c = root_vertex.add_child('c', nil)
      link_c.root = root_vertex
      link_c.parent = root_vertex
      link_c
    end

    let(:linked_chain) do
      link_a.add_link(link_b)
      link_b.add_link(link_c, 1)
      link_a
    end

    describe 'Root vertex' do
      it 'should be instace of TSS::Vertex' do
        expect(root_vertex).to be_an_instance_of(TSS::Vertex)
      end
    end

    describe 'Nested vertexes' do
      it 'should contain correct values' do
        expect(link_a.char).to eq('a')
        expect(link_a.parent).to be(root_vertex)
        expect(link_a.root).to be(root_vertex)
      end

      it 'should contain correct values' do
        expect(link_b.char).to eq('b')
        expect(link_b.parent).to be(root_vertex)
        expect(link_b.root).to be(root_vertex)
      end

      it 'should contain correct values' do
        expect(link_c.char).to eq('c')
        expect(link_c.parent).to be(root_vertex)
        expect(link_c.root).to be(root_vertex)
      end
    end

    describe 'Linked vertexes chain for word abc' do
      it 'link "a" => "b" should add links to the vertex' do
        link_a_to_b = linked_chain.get_link('b')
        expect(link_a_to_b).to be_an_instance_of(TSS::Link)
        expect(link_a_to_b.vertex).to be_an_instance_of(TSS::Vertex)
        expect(link_a_to_b.char).to eq('b')
        expect(link_a_to_b.end_index).to be_nil
      end

      it 'link "b" => "c" should add links to the vertex' do
        link_b_to_c = linked_chain.get_link('b').vertex.get_link('c')
        expect(link_b_to_c).to be_an_instance_of(TSS::Link)
        expect(link_b_to_c.vertex).to be_an_instance_of(TSS::Vertex)
        expect(link_b_to_c.char).to eq('c')
        expect(link_b_to_c.end_index).to eq(1)
      end
    end
  end
end
