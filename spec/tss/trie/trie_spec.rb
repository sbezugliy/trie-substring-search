RSpec.describe TSS::Trie do
  # Trie for dict "a cba cbe de a dfe abe df x dfe", with indices as in array
  describe 'Trie building' do
    let(:full_tss) { TSS::Trie.new(%w[a cba cbe de a dfe abe df x dfe], :full) }
    let(:flat_tss) { TSS::Trie.new(%w[a cba cbe de a dfe abe df x dfe], :flat) }
    let(:ac_tss) { TSS::Trie.new(%w[a cba cbe de a dfe abe df x dfe], :aho_corasick) }
    let(:wrong_tss) { TSS::Trie.new(%w[a cba cbe de a dfe abe df x dfe], :xxx) }
    let!(:text) { 'sedateragextrod' }

    it 'creates full trie ' do
      expect(full_tss).to be_an_instance_of(TSS::Trie)
      expect(full_tss.trie_instance).to be_an_instance_of(TSS::Tries::Full)
    end

    it 'creates flat trie ' do
      expect(flat_tss).to be_an_instance_of(TSS::Trie)
      expect(flat_tss.trie_instance).to be_an_instance_of(TSS::Tries::Flat)
    end

    it 'creates ac trie ' do
      expect(ac_tss).to be_an_instance_of(TSS::Trie)
      expect(ac_tss.trie_instance).to be_an_instance_of(TSS::Tries::AC)
    end

    it 'raises argument exception on wrong trie type' do
      expect { wrong_tss }.to raise_error(ArgumentError)
    end
  end
end
