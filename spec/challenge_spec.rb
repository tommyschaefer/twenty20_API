require "spec_helper"

describe Twenty20::Challenge do
  describe "slug" do
    
    before(:all) do
      attributes = {"slug" => "technology-challenge"}
      @challenge = Twenty20::Challenge.new(attributes)
    end
    
    it "returns the slug for the challenge" do
      expect(@challenge.slug).to eq("technology-challenge")
    end

    it "should be immutable" do
      expect{@challenge.slug = "some new slug"}.to raise_error(NoMethodError)   
    end
  end

  describe "name" do
    it "returns the name of the challenge" do
      attributes = {"name" => "technology"}
      challenge = Twenty20::Challenge.new(attributes)
      expect(challenge.name).to eq("technology")
    end
  end

  describe "description" do
    it "returns the description of the challenge" do
      attributes = {"description" => "really cool challenge"}
      challenge = Twenty20::Challenge.new(attributes)
      expect(challenge.description).to eq("really cool challenge")
    end
  end
end
