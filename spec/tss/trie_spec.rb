# frozen_string_literal: true

RSpec.describe TSS::Trie do
  # Trie for dict "a cba cbe de a dfe abe df x dfe", with indices as in array
  describe 'Trie building' do
    let(:full_tss) { described_class.new(%w[a cba cbe de a dfe abe df x dfe], :full) }
    let(:flat_tss) { described_class.new(%w[a cba cbe de a dfe abe df x dfe], :flat) }
    let(:ac_tss) do
      described_class.new(%w[a cba cbe de a dfe abe df x dfe],
                          :aho_corasick)
    end
    let(:wrong_tss) { described_class.new(%w[a cba cbe de a dfe abe df x dfe], :xxx) }
    let(:text) { 'sedateragextrod' }

    context 'when trie is full' do
      it { expect(full_tss).to be_an_instance_of(described_class) }
      it { expect(full_tss.trie_instance).to be_an_instance_of(TSS::Tries::Full) }
    end

    context 'when data is wrong' do
      it { expect { wrong_tss }.to raise_error(ArgumentError) }
    end
  end
end
