require "spec_helper"

describe Twenty20::Item do
  describe "category" do
    it "returns the items category" do
      attributes = {"caption" => "mobile photography ftw"}
      item = Twenty20::Item.new(attributes)
      expect(item.caption).to eq("mobile photography ftw")
    end

    it "returns nil when not present" do
      item = Twenty20::Item.new
      expect(item.caption).to eq(nil)
    end

    it "should be immutable" do
      item = Twenty20::Item.new
      expect{item.category = "not allowed"}.to raise_error(NoMethodError) 
    end
  end
 
  describe "id" do
    it "returns the items id " do
      attributes = {"id" => 1}
      item = Twenty20::Item.new(attributes)
      expect(item.id).to eq(1)
    end

    it "returns nil when not present" do
      item = Twenty20::Item.new
      expect(item.id).to eq(nil)
    end
  end 
 
  describe "source_name" do
    it "returns the items id " do
      attributes = {"source_name" => "Instagram"}
      item = Twenty20::Item.new(attributes)
      expect(item.source_name).to eq("Instagram")
    end

    it "returns nil when not present" do
      item = Twenty20::Item.new
      expect(item.source_name).to eq(nil)
    end
  end
end