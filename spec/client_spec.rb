require 'spec_helper'

describe Client do

  describe "BASE_URI" do
    it "returns the base uri for the api" do
      expect(Client::BASE_URI).to eq("https://api-v2.twenty20.com/")
    end
  end

  describe "get_featured_items" do

    before(:all) do
      @client = Client.new
    end

    it "returns an Array" do
      expect(@client.get_featured_items.class).to eq(Array)
    end

    it "returns an Array of Item objects" do
      expect(@client.get_featured_items[0].class).to eq(Item)
    end

    it "returns error if status is not 200" do
      fake_response = double
      fake_response.stub(:code) { 400 }
      Client.stub(:get)  { fake_response }
      response = @client.get_featured_items
      expect(response).to eq("Error")
    end

    it "doesnt return error if status is 200" do
    end
  end

  describe "get_challenges" do
    before(:all) do
      @client = Client.new
    end

    it "should return an array of challenge objects" do
      response = @client.get_challenges
      expect(response.class).to eq(Array);
    end
  end
end
