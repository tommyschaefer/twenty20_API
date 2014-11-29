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
      item_collection = to_item_collection(response)
      item_collection
    else
      "Error"
    end
  end

  private

  def to_item_collection(response)  #creates Item objects out of each element in the response object and returns this new array
    response.parsed_response["items"].collect {|item| Item.new(item)}
  end
end

class Item
  attr_reader :caption, :id, :source_name, :image_url, :featured_at, :user_first_name, 
                :user_last_name, :user_avatar_url, :username, :display_name
  def initialize(attributes = {})     #set default so attributes will default to nil and not throw exception if not present
    @caption = attributes["caption"]
    @id = attributes["id"]
    @source_name = attributes["source_name"]
    @image_url = attributes["standard_url"]
    @featured_at = attributes["featured_at"]
    @user_first_name = attributes["first_name"]
    @user_last_name = attributes["last_name"]
    @user_avatar_url = attributes["avatar"]
    @username = attributes["username"]
    @display_name = attributes["display_name"]
  end
end
