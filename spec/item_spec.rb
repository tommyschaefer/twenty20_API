require "spec_helper"

describe ItemCollection do
  describe "items" do
    it "should have an array of items" do
      item_collection = ItemCollection.new
      expect(item_collection.items.class).to eq(Array)
    end
  end

  describe "initialize_items" do
    it "should create objects in array into items" do
      
    end
  end
end
