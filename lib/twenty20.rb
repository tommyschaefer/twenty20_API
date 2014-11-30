require "twenty20/version"
require "twenty20/item"
require "twenty20/challenge"
require "httparty"

module Twenty20
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
end
