module Twenty20
  class Client
    include HTTParty

    BASE_URI = 'https://api-v2.twenty20.com/'

    def get_featured_items(&block)
      resource = build_route('items/featured', featured: true)
      response_for(resource, :item, &block)
    end

    def get_challenges(&block)
      resource = build_route('/challenges/open-for-submissions')
      response_for(resource, :challenge, &block)
    end

    private

    def response_for(resource, type, &block)
      response = self.class.get(resource)

      return 'Error' unless response.code == 200

      collection = to_collection(response, type)

      return collection unless block_given?

      collection.each do |item|
        block.call(item)
      end
    end

    def to_collection(response, collection_class)
      collection_class = collection_class.to_s

      response.parsed_response[collection_class.pluralize].map do |e|
        "Twenty20::#{collection_class.singularize.classify}".constantize.new(e)
      end
    end

    def build_route(uri, params = {})
      BASE_URI + uri + '?' + params.to_query
    end
  end
end
