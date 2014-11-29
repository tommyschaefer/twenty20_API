require "twenty20/version"
require "httparty"
class Client 
  include HTTParty
  BASE_URI = "https://api-v2.twenty20.com/"
  
  def get_featured_items
    featured_route = "items/featured"
    featured_params = "?featured=true"
    resource = BASE_URI + featured_route + featured_params
    response = self.class.get(resource)
    if(response.code == 200)
      response.parsed_response["items"]
    else
      "Error"
    end
  end
end

class ItemCollection
  attr_accessor :items
  
  def initialize(items = [])
    @items = items
  end

  private

  def initialize_items(items)
    items.collect { Item.new(item) }
  end
end

class Item
  attr_accessor :caption
  def initialize(attributes = {})
    @caption = attributes["caption"]
  end
end
