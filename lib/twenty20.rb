require "twenty20/version"
require "httparty"

class Client 
  include HTTParty
  BASE_URI = "https://api-v2.twenty20.com/"
  
  def get_featured_items
    featured_route = "items/featured"
    featured_params = "?featured=true"
    resource = build_route(featured_route, featured_params) 
    response = self.class.get(resource)
    if(response.code == 200)
      item_collection = to_item_collection(response)
      item_collection
    else
      "Error"
    end
  end

  def get_challenges
    challenges_route = "/challenges/open-for-submissions"
    resource = build_route(challenges_route)
    response = self.class.get(resource) 
    if(response.code == 200)
      challenge_collection = to_challenge_collection(response)
      challenge_collection
    else
      "Error"
    end
  end

  private

  def to_item_collection(response)  #creates Item objects out of each element in the response object and returns this new array
    response.parsed_response["items"].collect {|item| Item.new(item)}
  end

  def to_challenge_collection(response)
    response.parsed_response["challenges"].collect {|challenge| Challenge.new(challenge)}
  end

  def build_route(uri, params = "")
    route = BASE_URI + uri + params
    route
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


class Challenge
  attr_reader :slug, :name, :description, :starts_at, :ends_at, :submission_count
  
  def initialize(attributes = {})
    @slug = attributes["slug"] 
    @name = attributes["name"]
    @description = attributes["description"]
    @starts_at = attributes["starts_at"]
    @ends_at = attributes["ends_at"]
    @submission_count = attributes["submission_count"]
  end
end
