require "spec_helper"

describe Challenge do
  describe "slug" do
    
    before(:all) do
      attributes = {"slug" => "technology-challenge"}
      @challenge = Challenge.new(attributes)
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
      challenge = Challenge.new(attributes)
      expect(challenge.name).to eq("technology")
    end
  end

  describe "description" do
    it "returns the description of the challenge" do
      attributes = {"description" => "really cool challenge"}
      challenge = Challenge.new(attributes)
      expect(challenge.description).to eq("really cool challenge")
    end
  end
end
