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
      expect(@client.get_featured_items.class).to eq(Array)
    end

    it "returns an Array of Item objects" do
      expect(@client.get_featured_items[0].class).to eq(Twenty20::Item)
    end

    it "returns error if status is not 200" do
      fake_response = double
      fake_response.stub(:code) { 400 }
      Twenty20::Client.stub(:get)  { fake_response }
      response = @client.get_featured_items
      expect(response).to eq("Error")
    end

    it "can accept a block and do something cool like push challenges into a new array" do
      val = []
      @client.get_featured_items {|item| val.push(item)}
      expect(val.empty?).to_not eq(true)

    end

  end

  describe "get_challenges" do
    before(:all) do
      @client = Twenty20::Client.new
    end

    it "should return an array of challenge objects" do
      response = @client.get_challenges
      expect(response.class).to eq(Array);
    end

    it "can accept a block and do something cool like push challenges into a new array" do
      val = []
      @client.get_challenges {|challenge|  val.push(challenge)}
      expect(val.empty?).to_not eq(true)
    end
  end
end
