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

    it "returns a hash" do
      expect(@client.get_featured_items.class).to eq(Array)
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
end
