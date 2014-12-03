require 'spec_helper'

describe Twenty20::Client do
  describe "BASE_URI" do
    it "returns the base uri for the api" do
      expect(Twenty20::Client::BASE_URI).to eq("https://api-v2.twenty20.com/")
    end
  end

  describe "get_featured_items" do
    before(:all) do
      @client = Twenty20::Client.new
    end

    it "returns an Array" do
      VCR.use_cassette('get_featured_items') do
        expect(@client.get_featured_items.class).to eq(Array)
      end
    end

    it "returns an Array of Item objects" do
      VCR.use_cassette('get_featured_items') do
        expect(@client.get_featured_items[0].class).to eq(Twenty20::Item)
      end
    end

    it "can accept a block and do something cool like push challenges into a new array" do
      val = []
      VCR.use_cassette("get_featured_items") do
        @client.get_featured_items {|item| val.push(item)}
        expect(val.empty?).to_not eq(true)
      end
    end
  end

  describe "get_challenges" do
    before(:all) do
      @client = Twenty20::Client.new
    end

    it "should return an array of challenge objects" do
      VCR.use_cassette("get_challenges") do
        response = @client.get_challenges
        expect(response.class).to eq(Array);
      end
    end

    it "can accept a block and do something cool like push challenges into a new array" do
      VCR.use_cassette("get_challenges") do 
        val = []
        @client.get_challenges {|challenge|  val.push(challenge)}
      expect(val.empty?).to_not eq(true)
      end
    end
  end
end
