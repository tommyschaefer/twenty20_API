require 'spec_helper'

describe Twenty20::Client do
  let(:instance) { described_class.new }

  describe 'BASE_URI' do
    it 'returns the base uri for the api' do
      expect(described_class::BASE_URI).to eq('https://api-v2.twenty20.com/')
    end
  end

  { get_featured_items: Twenty20::Item,
    get_challenges: Twenty20::Challenge }.each do |method, response_type|
    describe "##{method}" do
      around(:each) do |example|
        VCR.use_cassette(method.to_s) do
          example.run
        end
      end

      it 'returns an Array' do
        expect(instance.send(method)).to be_a(Array)
      end

      it 'returns an Array of Item objects' do
        expect(instance.send(method)
          .all? { |e| e.is_a?(response_type) }).to be_truthy
      end

      it 'handles blocks correctly' do
        val = []
        instance.send(method) { |e| val.push(e) }
        expect(val).not_to be_empty
      end
    end
  end
end
