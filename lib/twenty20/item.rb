module Twenty20
  class Item < ApiObject
    def self.attributes
      %w(caption id
         source_name
         image_url
         featured_at
         user_first_name
         user_last_name
         user_avatar_url
         usename
         display_name)
    end
  end
end
