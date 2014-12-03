require 'spec_helper'

describe Twenty20::ApiObject do
  class Thing < Twenty20::ApiObject
    def self.attributes
      [:foo]
    end
  end

  let(:instance) { described_class.new }

  describe '.attributes' do
    it 'is empty' do
      expect(described_class.attributes).to be_empty
    end
  end

  describe '#initialize' do
    context 'with no attributes' do
      it 'raises no errors' do
        expect { instance }.not_to raise_error
      end
    end

    context 'with attributes' do
      let(:instance) { Thing.new(foo: :bar) }

      it 'defines reader' do
        expect(instance).to respond_to :foo
      end

      it 'sets instance variable' do
        expect(instance.foo).to eq :bar
      end
    end
  end
end
