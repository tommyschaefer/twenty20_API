require "twenty20/version"
require "twenty20/item"
require "twenty20/challenge"
require "httparty"

module Twenty20
  class Client 
    include HTTParty
    BASE_URI = "https://api-v2.twenty20.com/"
    
    def get_featured_items(&block)
      featured_route = "items/featured"
      featured_params = "?featured=true"
      resource = build_route(featured_route, featured_params) 
      response = self.class.get(resource)
      if(response.code == 200)
        item_collection = to_collection(response, "item")
        if(block_given?)
          item_collection.each do |item|
            block.call(item)
          end
        else
          item_collection
        end
      else
        "Error"
      end
    end

    def get_challenges(&block)
      challenges_route = "/challenges/open-for-submissions"
      resource = build_route(challenges_route)
      response = self.class.get(resource) 
      if(response.code == 200)
        challenge_collection = to_collection(response, "challenge")
        if block_given?
          challenge_collection.each do |challenge|
            block.call(challenge)
          end 
        else
          challenge_collection
        end
      else
        "Error"
      end
    end

    private

    def to_collection(response, collection_class)
      response.parsed_response[collection_class + "s"].collect do |e|
        o = Object.const_get("Twenty20::" + collection_class.capitalize) #creates new array full of collection_class object (i.e. Items, Challenges)
        o.new(e)
      end
    end

    def build_route(uri, params = "")
      route = BASE_URI + uri + params
      route
    end
  end
end
