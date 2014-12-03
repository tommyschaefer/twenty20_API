require 'spec_helper'

RSpec.shared_examples 'an API object' do
  let(:attributes) { {} }
  let(:instance) { described_class.new(attributes) }

  described_class.attributes.each do |method|
    describe "##{method}" do
      it "returns the item's #{method}" do
        attributes.merge!(method => 'foo')
        expect(instance.send(method)).to eq 'foo'
      end

      it 'returns nil when not present' do
        expect(instance.send(method)).to be_nil
      end

      it 'should not have a writer' do
        expect(instance).not_to respond_to("#{method}=")
      end
    end
  end
end
